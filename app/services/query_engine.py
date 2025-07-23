import re
import json
import logging
import textwrap
from decimal import Decimal
from datetime import datetime, date
from typing import List, Dict, Tuple, Optional

from openai import AsyncOpenAI
from sqlalchemy import text

from app.db.database import get_db_by_user_id
from app.utils.schema_extractor import extract_schema_relevant_to_prompt
from app.utils.date_utils import extract_date_range_from_prompt
from app.core.config import settings
from app.crud.query_router import create_query_response
from app.services.cache_service import get_cached_query, save_query_cache


class QueryEngine:
    def __init__(self):
        self.client = AsyncOpenAI(api_key=settings.OPENAI_API_KEY)
        self.model = settings.OPENAI_MODEL

#     async def generate_sql_from_prompt(self, prompt: str, db_schema: str) -> str:
#         # Add date constraints to prompt
#         date_range = extract_date_range_from_prompt(prompt)
#         if date_range:
#             start_date, end_date = date_range
#             prompt += f"\n\nUse date range: date >= '{start_date}' AND date < '{end_date}'."

#         # Construct the system prompt for OpenAI
#         system_prompt = f"""
# You are a PostgreSQL expert AI assistant.

# Your job:
# 1. Understand the user's business question
# 2. Analyze the provided schema
# 3. Generate ONE valid SQL query only — enclosed in triple backticks. DO NOT explain anything.

# Rules:
# - Use only table and column names from the schema
# - Include date filter when time range is implied
# - Avoid any made-up names or assumptions

# Schema:
# {db_schema}

# User Prompt:
# {prompt}
# """

#         response = await self.client.chat.completions.create(
#             model=self.model,
#             messages=[{"role": "system", "content": system_prompt}],
#             temperature=0
#         )

#         usage = getattr(response, 'usage', None)
#         if usage:
#          logging.info(f"[OpenAI Usage] Prompt: {usage.prompt_tokens}, Completion: {usage.completion_tokens}, Total: {usage.total_tokens}")

#         raw = response.choices[0].message.content.strip()
#         match = re.search(r"```(?:sql)?\s*(.*?)\s*```", raw, re.DOTALL | re.IGNORECASE)
#         generated_sql = match.group(1).strip() if match else raw.strip()

#         generated_sql = textwrap.dedent(generated_sql).replace("\\n", "\n").strip()
#         processed_sql = force_cast_date_column(generated_sql)

#         logging.info(f"Generated SQL:\n{processed_sql}")
#         return processed_sql

    async def generate_sql_from_prompt(self, prompt: str, db_schema: dict) -> str:
        def build_system_prompt(user_prompt: str, db_schema: dict) -> str:
            # Extract date range
            date_range = extract_date_range_from_prompt(user_prompt)
            if date_range:
                start_date, end_date = date_range
                user_prompt += f"\n\nUse date range: date >= '{start_date}' AND date <= '{end_date}'."

            # Entity extraction (e.g., "to M/s XYZ Ltd")
            entity_name = None
            entity_match = re.search(r"to\s+(M/s\s+)?([\w\s&.,'()-]+)", user_prompt, re.IGNORECASE)
            if entity_match:
                entity_name = entity_match.group(2).strip()

            # Keyword detection
            prompt_lower = user_prompt.lower()
            used_vouchers_only = False

            # GST-specific
            if re.search(r"\b(cgst|sgst|igst|gst)\b", prompt_lower):
                user_prompt += "\n\nUse crdr = 'Dr' since GST paid is an outgoing (expense)."
                if entity_name:
                    user_prompt += (
                        f"\nFilter ledgername using: (ledgername ILIKE '%GST%' OR ledgername ILIKE '%CGST%' "
                        f"OR ledgername ILIKE '%SGST%' OR ledgername ILIKE '%IGST%' OR ledgername ILIKE '%{entity_name}%')"
                    )
                else:
                    user_prompt += (
                        "\nFilter ledgername using: (ledgername ILIKE '%GST%' OR ledgername ILIKE '%CGST%' "
                        "OR ledgername ILIKE '%SGST%' OR ledgername ILIKE '%IGST%')"
                    )           

            # Entity only
            elif entity_name:
                user_prompt += f"\n\nFilter using: ledgername ILIKE '%{entity_name}%'"

            # Sales/Purchase — use `vouchers` only
            if re.search(r"\b(sales|sales register|sales summary|purchase|purchase register|purchase summary)\b", prompt_lower):
                used_vouchers_only = True
                user_prompt += "\n\nNOTE: Use ONLY the `vouchers` table — DO NOT use `voucherledgerentries`."

            # Format schema
            if isinstance(db_schema, dict):
                schema_text = "\n".join(f"{table}: {', '.join(columns)}" for table, columns in db_schema.items())
            else:
                schema_text = db_schema.strip()

            # Conditional rules section
            if used_vouchers_only:
                rules_text = """
                Rules:
                - Use ONLY the `vouchers` table
                - Use `vouchertypename`, `date`, and `isdeleted` columns
                - DO NOT use `voucherledgerentries` under any circumstances
                - Use ILIKE with wildcards (e.g., ILIKE '%abc%') if filtering is needed
                - Always apply date filters if year or month is mentioned
                - DO NOT guess or invent joins, relationships, or columns that are not defined in the schema
                - If unsure, keep the query minimal and compliant
                """
            else:
                rules_text = """
                Rules:
                - Use ONLY the tables and columns exactly as listed in the schema below
                - DO NOT assume any implicit relationships or foreign keys unless explicitly visible in the schema
                - NEVER use or mention any table named 'ledgers' — it does NOT exist
                - All financial data comes from 'voucherledgerentries'
                - Use 'ledgername' from 'voucherledgerentries' to filter vendors/customers
                - Use 'crdr' = 'Cr' for **payables** (expenses, outgoing)
                - Use 'crdr' = 'Dr' for **receivables** (income, incoming)
                - Use ILIKE with wildcards (e.g., ILIKE '%abc%') for filtering ledgername if a name is mentioned
                - For GST-specific queries:
                    - Filter ledgername ILIKE '%CGST%' OR '%SGST%' OR '%IGST%' OR '%GST%' [OR vendor name if applicable]
                - For TDS-specific queries:
                    - Filter ledgername ILIKE '%TDS%'
                - Always apply date filters if year or month is mentioned
                - DO NOT guess or invent joins, relationships, or columns that are not defined in the schema
                - If unsure, keep the query minimal and compliant
                """

            return f"""
            You are a PostgreSQL expert AI assistant.

            Your task:
            1. Understand the user's business question
            2. Carefully analyze the schema below
            3. Generate ONE valid SQL query — enclosed in triple backticks. DO NOT explain anything.
            
            {rules_text.strip()}

            Schema:
            {schema_text}

            User Prompt:
            {user_prompt}
            """

        for attempt in range(2):
            system_prompt = build_system_prompt(prompt, db_schema)

            response = await self.client.chat.completions.create(
                model=self.model,
                messages=[{"role": "system", "content": system_prompt}],
                temperature=0
            )

            usage = getattr(response, 'usage', None)
            if usage:
                logging.info(f"[OpenAI Usage] Prompt: {usage.prompt_tokens}, Completion: {usage.completion_tokens}, Total: {usage.total_tokens}")

            raw = response.choices[0].message.content.strip()
            match = re.search(r"```(?:sql)?\s*(.*?)\s*```", raw, re.DOTALL | re.IGNORECASE)
            generated_sql = match.group(1).strip() if match else raw.strip()

            if "ledgers" in generated_sql.lower():
                logging.warning(f"❌ Invalid SQL generated (attempt {attempt+1}): contains forbidden table")
                if attempt == 0:
                    prompt += "\n\nDO NOT reference any table named 'ledgers'. Use only 'voucherledgerentries' and valid fields from schema."
                    continue
                else:
                    raise ValueError("Generated SQL still references forbidden tables after retry.")

            generated_sql = textwrap.dedent(generated_sql).replace("\\n", "\n").strip()
            processed_sql = force_cast_date_column(generated_sql)

            logging.info(f"✅ Valid SQL Generated:\n{processed_sql}")
            return processed_sql

        raise RuntimeError("SQL generation failed after multiple attempts.")





    # async def generate_sql_from_prompt(self, prompt: str, db_schema: str) -> str:
    #     """Convert *prompt* into SQL limited to the objects in *db_schema*."""

    #     # 1️⃣ Add an explicit date filter if the prompt implies one
    #     if (date_range := extract_date_range_from_prompt(prompt)):
    #         start_date, end_date = date_range
    #         prompt += (
    #             f"\n\nUse date range: date >= '{start_date}' AND date < '{end_date}'."
    #         )

    #     # 2️⃣ Compose the base system prompt
    #     system_prompt = textwrap.dedent(
    #         """
    #         You are a PostgreSQL expert AI assistant.

    #         Your job:
    #         1. Understand the user's business question.
    #         2. Analyse the provided schema.
    #         3. Generate ONE valid SQL query only — enclosed in triple backticks. DO NOT explain anything.

    #         Rules:
    #         - Use only table and column names present in the schema.
    #         - Include a date filter whenever a time range is implied.
    #         - Avoid any made‑up names or assumptions.
    #         - Use only real PostgreSQL functions (e.g., CAST(col AS NUMERIC) or col::NUMERIC).
    #         - Do NOT invent functions such as TO_NUMERIC.
    #         - When user asks for *quarterly* data, aggregate results **month-wise** using DATE_TRUNC('month', ...)
    #         """
    #     ).strip()

    #     # 3️⃣ Embed schema and user prompt
    #     system_prompt += f"\n\nSchema:\n{db_schema}\n\nUser Prompt:\n{prompt}"

    #     # 4️⃣ Voucher‑table guidance (only if both exist)
    #     vouchers_present = re.search(r"\bvouchers\b", db_schema, re.IGNORECASE)
    #     ledger_present   = re.search(r"\bvoucherledgerentries\b", db_schema, re.IGNORECASE)
    #     if vouchers_present and ledger_present:
    #         system_prompt += (
    #             "\n\nBoth `vouchers` and `voucherledgerentries` tables are available.\n"
    #             "• Query *only* the `vouchers` table if all requested columns are found there.\n"
    #             "• Join to `voucherledgerentries` **only when** the user needs data not present in `vouchers` (e.g., `crdr`, ledger amounts).\n"
    #             "• When you *do* join, join on `voucherledgerentries.voucher_id = vouchers.id` **and** filter rows appropriately (e.g., `voucherledgerentries.crdr = 'Cr'` for credit‑side totals) so that debit rows are not double‑counted.\n"
    #             "• After joining, aggregate **after** the join (or use `DISTINCT` on `vouchers.id`) to avoid duplicate‑row multiplication of amounts.\n"
    #             "• Use `SUM(voucherledgerentries.amount)` **or** `SUM(vouchers.totalamount)` ― never both in the same query ― and cast as NUMERIC if needed."
    #         )

    #     # 5️⃣ Request completion from OpenAI
    #     response = await self.client.chat.completions.create(
    #         model=self.model,
    #         messages=[{"role": "system", "content": system_prompt}],
    #         temperature=0,
    #     )

    #     # 6️⃣ Log usage if provided
    #     if (usage := getattr(response, "usage", None)):
    #         logging.info(
    #             "[OpenAI Usage] Prompt: %s, Completion: %s, Total: %s",
    #             usage.prompt_tokens, usage.completion_tokens, usage.total_tokens,
    #         )

    #     # 7️⃣ Extract SQL from the response, stripping backticks
    #     raw = response.choices[0].message.content.strip()
    #     match = re.search(r"```(?:sql)?\s*(.*?)\s*```", raw, re.DOTALL | re.IGNORECASE)
    #     sql_text = match.group(1).strip() if match else raw.strip()
    #     sql_text = textwrap.dedent(sql_text).replace("\\n", "\n").strip()

    #     # 8️⃣ Sanitise known invalid functions
    #     sql_text = fix_invalid_functions(sql_text)

    #     # 9️⃣ Ensure date literals are coerced properly
    #     sql_text = force_cast_date_column(sql_text)

    #     logging.info("Generated SQL:\n%s", sql_text)
    #     return sql_text

    async def generate_business_summary(self, user_prompt: str, sql_result: List[dict]) -> str:
        messages = [
            {
                "role": "system",
                "content": (
                    "You are a financial assistant. Based on a user question and SQL result, "
                    "generate a clear, business-readable summary like Tally reports."
                )
            },
            {
                "role": "user",
                "content": f"User Question: {user_prompt}\n\nSQL Result:\n{json.dumps(sql_result, indent=2)}"
            }
        ]

        response = await self.client.chat.completions.create(
            model=self.model,
            messages=messages,
            temperature=0.3
        )
        return response.choices[0].message.content.strip()


def force_cast_date_column(sql: str) -> str:
    return re.sub(
        r'EXTRACT\s*\(\s*MONTH\s+FROM\s+CAST\(\s*date\s+AS\s+DATE\s*\)\s*\)',
        'EXTRACT(MONTH FROM date)',
        sql,
        flags=re.IGNORECASE
    )


def extract_schema_entities(schema: str) -> Dict[str, set]:
    table_columns = {}
    current_table = None

    for line in schema.splitlines():
        line = line.strip()
        if line.lower().startswith("table:"):
            current_table = line.split(":", 1)[1].strip()
            table_columns[current_table] = set()
        elif current_table and line.startswith("- "):
            column = line[2:].split(":", 1)[0].strip()
            table_columns[current_table].add(column)
    return table_columns


def validate_sql_against_schema(sql: str, schema: str) -> bool:
    table_columns = extract_schema_entities(schema)

    # All valid tables and columns
    valid_identifiers = set()
    for table, columns in table_columns.items():
        valid_identifiers.add(table.lower())
        valid_identifiers.update(col.lower() for col in columns)

    # Reserved SQL keywords and functions
    reserved = {
        "select", "from", "where", "group", "by", "order", "asc", "desc",
        "and", "or", "sum", "count", "as", "on", "left", "join", "inner",
        "outer", "extract", "month", "year", "date", "interval", "cast",
        "to_char", "to_date", "to_timestamp", "between", "limit", "offset",
        "having", "distinct", "union", "case", "when", "then", "else", "end",
        "not", "null", "is", "current_date", "current_timestamp", "now",
        "true", "false", "in", "ilike", "coalesce", "avg", "min", "max",
        "round", "date_trunc", "nullif", "numeric", "substring",
        # Extra common keywords/functions
        "over", "partition", "row_number", "rank", "lead", "lag", "window",
        "using", "filter", "all", "any", "exists", "union", "intersect",
        "except", "timestamp"
    }

    # Remove string literals
    sql_clean = re.sub(r"('([^']|'')*')", "", sql)
    sql_clean = re.sub(r'(\"([^\"]|\"\")*\")', "", sql_clean)

    # Extract all word-like tokens
    tokens = set(re.findall(r"\b[a-zA-Z_][a-zA-Z0-9_]*\b", sql_clean))

    # Extract table/column aliases
    alias_matches = re.findall(
    r'\b(?:FROM|JOIN)\s+(?:\w+|\([^)]*\))\s+(?:AS\s+)?(\w+)',
    sql,
    re.IGNORECASE | re.DOTALL
    )
    aliases = {alias.lower() for alias in alias_matches}

    # Catch CTE aliases
    aliases.update(
        a.lower() for a in re.findall(r'\bWITH\s+(\w+)\s+AS', sql, re.IGNORECASE)
    )

    # Also handle column AS aliases (unchanged)
    aliases.update(a.lower() for a in re.findall(r'\bAS\s+(\w+)', sql, re.IGNORECASE))

    # Check unknowns
    unknowns = [
        token for token in tokens
        if token.lower() not in reserved
        and token.lower() not in valid_identifiers
        and token.lower() not in aliases
    ]

    if unknowns:
        logging.warning(f"[SQL Validation] Unknown identifiers: {unknowns}")
        return False

    return True


def fix_invalid_functions(sql: str) -> str:
    """Repair non‑standard or misspelled PostgreSQL function calls.

    Currently fixes:
    * `TO_NUMERIC(expr [, 'format'])` → `CAST(expr AS NUMERIC)`
      (handles dotted identifiers like `vouchers.totalamount` and an optional
       format string argument)
    """

    # Replace TO_NUMERIC(expr [, 'fmt']) with CAST(expr AS NUMERIC)
    def _replace_to_numeric(match: re.Match) -> str:
        expr = match.group("expr").strip()
        return f"CAST({expr} AS NUMERIC)"  # Discards optional format pattern

    sql = re.sub(
        r"\bTO_NUMERIC\s*\(\s*(?P<expr>[a-zA-Z_][a-zA-Z0-9_\.]*)(?:\s*,\s*'[^']*')?\s*\)",
        _replace_to_numeric,
        sql,
        flags=re.IGNORECASE,
    )

    return sql


async def get_all_tables_and_columns(db) -> Dict[str, List[str]]:
    tables = await db.fetch_all("""
        SELECT table_name FROM information_schema.tables 
        WHERE table_schema = 'public'
    """)
    schema = {}
    for table in tables:
        table_name = table["table_name"]
        columns = await db.fetch_all("""
            SELECT column_name FROM information_schema.columns 
            WHERE table_name = :table
        """, {"table": table_name})
        schema[table_name] = [col["column_name"] for col in columns]
    return schema


async def generate_sql_with_constraints(engine: QueryEngine, prompt: str, schema: str, full_schema: Dict[str, List[str]]) -> tuple[str, str]:
    constraint_block = "\n\nOnly use the following tables and columns:\n"
    for table, cols in full_schema.items():
        constraint_block += f"- {table}: {', '.join(cols)}\n"

    full_prompt = (
        f"User query: {prompt}\n\n"
        f"Schema:\n{schema}\n"
        f"{constraint_block}\n"
        "Generate a syntactically correct SQL query using only the above."
    )

    sql = await engine.generate_sql_from_prompt(full_prompt, schema)
    return sql, full_prompt


# async def execute_sql_query(user_id: str, prompt: str) -> dict:
#     db = await get_db_by_user_id(user_id)
#     schema = await extract_schema_relevant_to_prompt(db, prompt)
#     full_schema = await get_all_tables_and_columns(db)

#     engine = QueryEngine()
#     sql = await generate_sql_with_constraints(engine, prompt, schema, full_schema)

#     if not validate_sql_against_schema(sql, schema):
#         return {
#             "success": False,
#             "error": "Generated SQL references unknown tables or columns.",
#             "query": sql,
#             "executed_at": datetime.utcnow().isoformat() + "Z"
#         }

#     try:
#         rows = await db.fetch_all(text(sql))

#         def make_json_serializable(obj):
#             if isinstance(obj, dict):
#                 return {
#                     k: (
#                         float(v) if isinstance(v, Decimal)
#                         else v.isoformat() if isinstance(v, (date, datetime))
#                         else v
#                     ) for k, v in obj.items()
#                 }
#             return obj

#         results = [make_json_serializable(dict(row)) for row in rows]
#         summary = await engine.generate_business_summary(prompt, results)

#         return {
#             "success": True,
#             "query": sql,
#             "result": results,
#             "summary": summary,
#             "executed_at": datetime.utcnow().isoformat() + "Z"
#         }

#     except Exception as e:
#         logging.error("Error executing SQL", exc_info=True)
#         return {
#             "success": False,
#             "error": str(e),
#             "query": sql,
#             "executed_at": datetime.utcnow().isoformat() + "Z"
#         }

async def execute_sql_query(user_id: str, prompt: str) -> dict:
    async with get_db_by_user_id(user_id) as db:  # ✅ Fixed this line

        # Step 1: Extract schema info
        schema = await extract_schema_relevant_to_prompt(db, prompt)
        full_schema = await get_all_tables_and_columns(db)

        # Step 2: Try cache
        cached = await get_cached_query(db, prompt, schema)
        if cached:
            logging.info("Cache hit!")
            return {
                "success": True,
                "query": cached["generated_sql"],
                "result": cached["sql_result"],
                "summary": cached["summary"],
                "executed_at": cached["executed_at"].isoformat() if cached["executed_at"] else datetime.utcnow().isoformat() + "Z"
            }

        # Step 3: Cache miss, generate SQL
        engine = QueryEngine()
        sql, full_prompt = await generate_sql_with_constraints(engine, prompt, schema, full_schema)

        # Step 4: Validate
        if not validate_sql_against_schema(sql, schema):
            return {
                "user_id": user_id,
                "success": False,
                "error": "Generated SQL references unknown tables or columns.",
                "query": sql,
                "executed_at": datetime.utcnow().isoformat() + "Z"
            }

        # Step 5: Execute SQL
        try:
            rows = await db.fetch_all(text(sql))

            def make_json_serializable(obj):
                if isinstance(obj, dict):
                    return {
                        k: (
                            float(v) if isinstance(v, Decimal)
                            else v.isoformat() if isinstance(v, (date, datetime))
                            else v
                        ) for k, v in obj.items()
                    }
                return obj

            results = [make_json_serializable(dict(row)) for row in rows]

            # Step 6: Generate summary
            summary = await engine.generate_business_summary(prompt, results)

            # Step 7: Save to cache
            await save_query_cache(
                db=db,
                user_id=user_id,
                prompt=prompt,
                full_prompt=full_prompt,
                db_schema=schema,
                generated_sql=sql,
                sql_result=results,
                summary=summary,
                affected_tables=["transactions"]
            )
            logging.info("save_query_cache function executed")

            await create_query_response(
                db=db,
                user_id=user_id,
                success="True",
                prompt=prompt,
                query=sql,
                result=results,
                summary=summary
            )

            # Step 8: Return result
            return {
                "user_id": user_id,
                "success": True,
                "query": sql,
                "result": results,
                "summary": summary,
                "executed_at": datetime.utcnow().isoformat() + "Z"
            }

        except Exception as e:
            logging.error("Error executing SQL", exc_info=True)
            return {
                "user_id": user_id,
                "success": False,
                "error": str(e),
                "query": sql,
                "executed_at": datetime.utcnow().isoformat() + "Z"
            }
