# app/services/cache_service.py

import logging
import json
from app.utils.hash_utils import compute_prompt_hash
import uuid

async def get_cached_query(db, prompt: str, db_schema: str):
    prompt_hash = compute_prompt_hash(prompt, db_schema)
    logging.info(f"Looking for cached query with hash: {prompt_hash}")

    query = """
        SELECT * FROM query_cache
        WHERE prompt_hash = :prompt_hash
        LIMIT 1
    """
    try:
        row = await db.fetch_one(query, {"prompt_hash": prompt_hash})
        if row:
            result = dict(row)

            # Fix sql_result if it's a string
            if isinstance(result["sql_result"], str):
                try:
                    result["sql_result"] = json.loads(result["sql_result"])
                except json.JSONDecodeError:
                    logging.warning("sql_result is invalid JSON string")
                    result["sql_result"] = []

            return result
        return None
    except Exception:
        logging.exception("Error during DB cache lookup")
        return None

async def save_query_cache(
    db,
    user_id: str,
    prompt: str,
    db_schema: str,
    generated_sql: str,
    sql_result,
    summary: str,
    affected_tables: list[str],
    full_prompt: str = None
):
    from app.models.query_cache import QueryCache
    from app.utils.hash_utils import compute_prompt_hash

    prompt_hash = compute_prompt_hash(prompt, db_schema)

    try:
        query = QueryCache.__table__.insert()
        values = {
            "id": str(uuid.uuid4()),  # ✅ explicitly assign the UUID
            "user_id": user_id,
            "prompt": prompt,
            "full_prompt": full_prompt,
            "db_schema": db_schema,
            "generated_sql": generated_sql,
            "sql_result": sql_result,
            "summary": summary,
            "prompt_hash": prompt_hash,
            "affected_tables": affected_tables,
        }

        await db.execute(query=query, values=values)
    except Exception:
        logging.exception("Error during saving query cache")