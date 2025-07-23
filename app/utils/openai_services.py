# app/external_services/openaiservices.py
from typing import List, Dict, Any
from openai import AsyncOpenAI
from app.core.config import settings # Correctly imported from app.core.config
import json
import re
import logging
from sqlalchemy.orm import Session
from sqlalchemy import text
from calendar import month_name
from datetime import datetime

logger = logging.getLogger(__name__)

class OpenAIService:
    def __init__(self):
        # FIX: Correctly initializing client and model from settings
        self.client = AsyncOpenAI(api_key=settings.OPENAI_API_KEY)
        self.model = settings.OPENAI_MODEL
        self.turns_queue = []  

    async def generate_response(self, prompt: str, context: str = None) -> str:
        """
        Generate a response using OpenAI's API with optional context for RAG.
        """
        try:
            messages = []
            if context:
                messages.append({"role": "system", "content": f"Context: {context}"})
            messages.append({"role": "user", "content": prompt})

            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages
            )
            return response.choices[0].message.content
        except Exception as e:
            logger.error(f"Error generating response: {e}")
            raise Exception(f"Error generating response: {str(e)}")

    async def summarize_text(self, text: str) -> str:
        """
        Summarize the given text in 2–3 sentences using OpenAI's GPT model asynchronously.
        """
        try:
            prompt = f"Summarize the following content in 2-3 sentences:\n\n{text}"
            messages = [
                {"role": "system", "content": "You are a helpful assistant that summarizes drug information."},
                {"role": "user", "content": prompt}
            ]
            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages
            )
            return response.choices[0].message.content.strip()
        except Exception as e:
            logger.error(f"Error summarizing text: {e}")
            raise Exception(f"Error summarizing text: {str(e)}")

    async def extract_metadata_from_text(self, text: str) -> dict:
        """
        Extract structured metadata from a medical document using GPT and safely parse it as JSON.
        """
        try:
            prompt = f"""
You are a medical document parser. Extract the following metadata from the content provided below:

Return the result in strict JSON format with the following keys:
- publication_date (YYYY-MM-DD or null)
- author
- drug_name
- active_ingredients (as a list of strings)
- therapeutic_category
- dosage_form
- manufacturer
- approval_status
- clinical_phase
- regulatory_authority
- document_type
- document_version
- confidentiality_level
- expiration_date (YYYY-MM-DD or null)
- keywords (as a list of strings)

Text:
\"\"\"
{text}
\"\"\"
"""

            messages = [
                {"role": "system", "content": "You are an expert in extracting structured metadata from medical documents."},
                {"role": "user", "content": prompt}
            ]

            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages
            )
            content = response.choices[0].message.content.strip()

            return self._extract_json_from_text(content)

        except Exception as e:
            logger.error(f"Error extracting metadata: {e}")
            raise Exception(f"Error extracting metadata: {str(e)}")

    def _extract_json_from_text(self, text: str) -> dict:
        """
        Extract JSON object from text even if there's extra text around it.
        """
        try:
            match = re.search(r"\{.*\}", text, re.DOTALL)
            if not match:
                raise ValueError("No valid JSON object found in the response.")
            return json.loads(match.group())
        except json.JSONDecodeError as e:
            raise Exception(f"Failed to decode JSON from OpenAI response: {e}")


    async def generate_summary(self, content: str, query: str) -> str:
        prompt = f"""
        You are a helpful assistant summarizing content from a medical PDF.

        The user has a question: "{query}"

        Based on the PDF content below, answer the question as specifically as possible.
        Use only information that is clearly present in the content. If the content does not contain an answer, begin your response with:
        "Not found in the document, but based on general knowledge:" and provide a helpful answer.

        Limit your response to 1–2 sentences.

        PDF Content:
        \"\"\"
        {content}
        \"\"\"

        Answer:
        """
        try:
            messages = [
                {"role": "system", "content": "You are an expert in extracting answers from medical documents."},
                {"role": "user", "content": prompt}
            ]
            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages
            )
            return response.choices[0].message.content.strip()
        except Exception as e:
            logger.error(f"OpenAI API error during summary generation: {e}")
            return "Not found in the document, and the answer could not be generated."


 
    async def chat(self, prompt: str, context: str = None) -> str:
        """
        General-purpose chat with OpenAI's GPT model.

        :param prompt: The user's input prompt.
        :param context: Optional context (e.g., previous messages or RAG content).
        :return: GPT-generated response as a string.
        """
        try:
            messages = []
            if context:
                messages.append({"role": "system", "content": context})
            messages.append({"role": "user", "content": prompt})

            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages
            )

            return response.choices[0].message.content.strip()
        except Exception as e:
            logger.error(f"OpenAI chat failed: {e}")
            raise Exception(f"OpenAI chat failed: {e}")

    async def analyze_query_bias(self, query: str) -> str:
        """
        Analyze the query using OpenAI's API to determine if it has semantic or recency bias.
        Returns 'semantic' or 'recency' based on query content.
        """
        try:
            prompt = f"""
            Determine if the following query prioritizes recent information or semantic relevance.
            - If the query emphasizes recent, new, or time-sensitive information (e.g., 'latest', 'recent', 'newest'), return 'recency'.
            - Otherwise, if the query focuses on meaning or context without time constraints, return 'semantic'.
            Query: "{query}"
            Return only the word 'semantic' or 'recency'.
            """
            messages = [
                {"role": "system", "content": "You are an expert in analyzing query intent."},
                {"role": "user", "content": prompt}
            ]
            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages,
                max_tokens=10,
            )
            bias_type = response.choices[0].message.content.strip().lower()

            logger.debug(f"Raw bias type from OpenAI: '{bias_type}'")

            if bias_type not in ['semantic', 'recency']:
                logger.warning(f"Invalid bias type from OpenAI: {bias_type}. Defaulting to semantic.")
                return 'semantic'

            logger.info(f"OpenAI classified query bias as: {bias_type}")
            return bias_type
        except Exception as e:
            logger.error(f"Query bias analysis with OpenAI failed: {e}")
            return 'semantic' # Fallback to semantic bias


    async def generate_conversation_title(self, query: str) -> str:
        """
        Generates a concise and meaningful title for a new conversation
        based on the initial user query, simulating how chat applications title chats.
        """
        try:
            prompt = f"""
            You are an AI assistant designed to automatically generate short, precise, and meaningful titles for new chat conversations.
            The title should accurately reflect the main topic or intent of the *initial user query* for the conversation.
            Aim for a title that is concise (under 10 words) and easy to understand at a glance.

            Initial User Query: "{query}"

            Generated Title:
            """

            messages = [
                {"role": "system", "content": "You are an AI assistant that generates concise titles for chat conversations."},
                {"role": "user", "content": prompt}
            ]
            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages,
                max_tokens=20, # Keep this low for conciseness
            )
            title = response.choices[0].message.content.strip()

            if not title or len(title.split()) > 10:
                logger.warning(f"Generated title '{title}' for query '{query}' is invalid (empty or too long). Falling back to truncated query.")
                title = query[:50] + "..." if len(query) > 50 else query
            else:
                logger.info(f"Generated conversation title: '{title}' for query: '{query}'")

            return title
        except Exception as e:
            logger.error(f"Failed to generate conversation title: {e}")
            return query[:50] + "..." if len(query) > 50 else query # Fallback to truncated query if AI fails


    async def generate_history_summary(self, conversation_messages: list[dict]) -> str:
        """
        Generates a concise summary of the last few messages in a conversation
        to maintain context for the LLM.
        :param conversation_messages: A list of dicts, each with 'query_text' and 'response_text'
        """
        if not conversation_messages:
            return ""

        history_str = "\n".join([
            f"User: {msg['query_text']}\nAssistant: {msg['response_text']}"
            for msg in conversation_messages
        ])

        prompt = f"""
        Summarize the following conversation history concisely (1-3 sentences) to help an AI assistant understand the ongoing context.
        This summary will be used to provide context for the next user query in the same conversation.

        Conversation History:
        \"\"\"
        {history_str}
        \"\"\"

        Concise Summary:
        """
        try:
            messages = [
                {"role": "system", "content": "You are an AI assistant specialized in summarizing chat history for context."},
                {"role": "user", "content": prompt}
            ]
            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages,
                max_tokens=100, # Keep summary concise
                temperature=0.3 # Lower temperature for factual summary
            )
            summary = response.choices[0].message.content.strip()
            logger.info(f"Generated history summary: {summary}")
            return summary
        except Exception as e:
            logger.error(f"Failed to generate history summary: {e}")
            return "Unable to summarize past conversation." # Fallback

    async def generate_conversation_history_summary(
        self,
        current_summary: str,
        user_query: str,
        assistant_response: str
    ) -> str:
        """
        Maintains and summarizes the last 10 turns of conversation.
        """
        # Add the latest interaction
        self.turns_queue.append(
            (user_query.strip(), assistant_response.strip())
        )

        # Build sequential turn log
        sequential_log = ""
        for user_q, assistant_r in self.turns_queue:
            sequential_log += f"User asked: {user_q}. Assistant responded: {assistant_r}.\n"

        messages = [
            {
                "role": "system",
                "content": (
                    "You are a helpful assistant that writes a concise, sequential summary of a conversation. "
                    "Each turn should follow the format: 'User asked: ... Assistant responded: ...'. "
                    "Maintain clarity and brevity. Combine repetitive details but keep sequence intact. "
                    "Keep final output under 150 tokens."
                )
            },
            {
                "role": "user",
                "content": f"Conversation turns:\n{sequential_log.strip()}\n\n"
                           f"Generate a concise, flowing summary of the conversation using this format."
            }
        ]

        try:
            response = await self.client.chat.completions.create(
                model=self.model,
                messages=messages,
                max_tokens=150,
                temperature=0.3,
            )
            return response.choices[0].message.content.strip()
        except Exception as e:
            logger.error(f"Error generating conversation history summary: {e}")
            return ""

    async def generate_ppt_slide_data(self, raw_text: str) -> list[dict]:
        """
        Generates structured PowerPoint slide content from unstructured medical-related text.
        Each slide includes: title, bullets, short notes, references, image_prompt, and slide_type.
        """
        prompt = f"""
        You are an expert medical content writer helping to create a professional PowerPoint presentation for a medical audience (e.g., doctors, MDs).

        Based on the following text, generate a list of slides. Each slide should be a JSON object with these keys:
        - title: A clear and short slide title
        - bullets: 3–5 bullet points (concise and informative)
        - short_notes: A 2–4 line explanation of the content in prose
        - references: A list of sources or citations, if any (can be empty)
        - slide_type: Choose from ["title", "content", "summary", "quote", "data"]

        Return ONLY a JSON array called "slides", for example:
        [
        {{
            "title": "Overview of Type 2 Diabetes",
            "bullets": [
            "Chronic metabolic disorder",
            "Characterized by insulin resistance",
            "Linked to obesity and inactivity"
            ],
            "short_notes": "Type 2 Diabetes is a long-term condition involving high blood sugar levels due to poor insulin usage. It’s commonly associated with lifestyle factors.",
            "references": ["WHO", "PubMed:123456"],
            "image_prompt": "An illustration showing insulin resistance in muscle and liver cells",
            "slide_type": "content"
        }},
        ...
        ]

        Text:
        \"\"\"
        {raw_text}
        \"\"\"
        """

        try:
            response = await self.client.chat.completions.create(
                # model="gpt-4",
                model=settings.OPENAI_MODEL,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                response_format={"type": "json_object"} 
            )

            content = response.choices[0].message.content
            slides_data = json.loads(content)
            
            # If the model returns {"slides": [...]}, extract the list
            if isinstance(slides_data, dict) and "slides" in slides_data:
                return slides_data["slides"]
            
            # If the model returns a list directly
            if isinstance(slides_data, list):
                return slides_data
            
            raise ValueError("AI did not return a valid slides list or object with 'slides' key.")

        except json.JSONDecodeError as e:
            logger.error(f"Failed to decode JSON from generate_ppt_slide_data response: {e}")
            raise ValueError(f"AI did not return valid JSON for slides: {e}")

        except Exception as e:
            logger.error(f"Error generating PPT slide data: {e}")
            raise Exception(f"Failed to generate PPT slide data: {e}")
 
    async def interpret_query_with_openai(self, query: str, db: Session):
        current_year = datetime.now().year
        today = datetime.now()

        # Dynamically determine current financial year
        if today.month < 4:
            fy_start = datetime(today.year - 1, 4, 1)
            fy_end = datetime(today.year, 3, 31)
        else:
            fy_start = datetime(today.year, 4, 1)
            fy_end = datetime(today.year + 1, 3, 31)

        prompt = f"""
    You are a financial data assistant. Given this user query, convert it into an optimized SQL query for PostgreSQL.

    If the query is about total sales:
    - Return:
        - party_name
        - SUM(credit_amount) AS total_sales_per_party
        - SUM(cgst_amount) AS cgst_amount
        - SUM(sgst_amount) AS sgst_amount
        - SUM(igst_amount) AS igst_amount
        - SUM(cgst_amount + sgst_amount + igst_amount) AS total_gst
        - SUM(credit_amount) AS total_sales_amount
    - Group by party_name   

    If the query is about monthly or period-wise sales (e.g., 'month-wise', 'quarterly', 'by month'):
    - Assume the year is {current_year} if not mentioned.
    - Return:
        - TO_CHAR(date, 'YYYY-MM') AS month
        - SUM(credit_amount) AS monthly_sales

    If the query is about top customers or which customer bought the most:
    - Extract the month and year from query if present (default to current month/year).
    - Return:
        - party_name
        - SUM(credit_amount) AS total_purchase
    - Group by party_name
    - Order by total_purchase DESC
    - Limit to top 5

    If the query is about purchases:
    - Extract the month and year (default to current)
    - Return:
        - party_name
        - SUM(debit_amount) AS total_purchases
        - SUM(cgst_amount + sgst_amount + igst_amount) AS total_gst
        - SUM(tds_amount) AS total_tds
    - Group by party_name

    If the query is about office rent payments:
    - Return:
        - SUM(debit_amount) AS total_rent
        - COUNT(*) AS payment_count
    - Filter:
        - ledger_account = 'Office Rent'
        - date BETWEEN '{fy_start.date()}' AND '{fy_end.date()}'

    If the query is about top expense categories:
    - Return:
        - ledger_account
        - SUM(debit_amount) AS total_expense
        - (SUM(debit_amount) * 100.0 / (SELECT SUM(debit_amount) FROM transactions WHERE debit_amount > 0 AND date BETWEEN '{fy_start.date()}' AND '{fy_end.date()}')) AS percentage
    - Filter:
        - debit_amount > 0
        - date BETWEEN '{fy_start.date()}' AND '{fy_end.date()}'
    - Group by ledger_account
    - Order by total_expense DESC
    - Limit 5

    If the query is about GST liability:
    - Use a UNION ALL to combine:
        - Output GST: SUM of cgst, sgst, igst for 'Sales'
        - Input GST: SUM of cgst, sgst, igst for 'Purchase'
    - Include:
        - gst_type ('Output GST' or 'Input GST')
        - SUM(cgst_amount) AS cgst
        - SUM(sgst_amount) AS sgst
        - SUM(igst_amount) AS igst
    - Filter by specific month/year if mentioned (default to current month)
    - Date format: 'YYYY-MM-DD'

    If the query is about TDS deducted:
    - Return:
        - tds_section
        - SUM(tds_amount) AS total_tds
        - COUNT(*) AS transaction_count
    - Filter:
        - tds_amount > 0
        - Date range: financial year April 1 to March 31 (or as specified)
    - Group by tds_section
    - Order by total_tds DESC

    If the query is about IGST transactions:
    - Return:
        - date
        - party_name
        - voucher_type
        - igst_amount
        - narration
    - Filter for:
        - igst_amount > 0
        - date within Apr 1, 2024 – Mar 31, 2025

    If the query is about outstanding balance for a specific party:
    - Return:
        - party_name
        - SUM(CASE WHEN debit_amount > 0 THEN debit_amount ELSE -credit_amount END) AS outstanding_balance
    - Filter:
        - party_name = '<party_name>' (extracted from the query)
    - Group by party_name

    If the query is about top suppliers or largest purchase parties:
    - Return:
        - party_name
        - SUM(debit_amount) AS total_purchase_value
        - (SUM(debit_amount) * 100.0 / (SELECT SUM(debit_amount) FROM transactions WHERE voucher_type = 'Purchase')) AS percentage
    - Filter:
        - voucher_type = 'Purchase'
        - ledger_account = 'Purchase Account'
        - date BETWEEN '{fy_start.date()}' AND '{fy_end.date()}'
    - Group by party_name
    - Order by total_purchase_value DESC
    - Limit 5

    If the query mentions customers from a specific location:
    - Extract branch name (e.g., "from Mumbai" → "Mumbai Branch")
    - Return:
        - party_name
        - SUM(credit_amount) as total_sales
    - Filter:
        - branch = '[Extracted Branch] Branch'
        - voucher_type = 'Sales'
        - ledger_account = 'Sales Account'
    - Group by party_name
    - Order by total_sales DESC

    If the query is about current bank or cash balances:
    - Return:
        - ledger_account
        - current_balance (calculated as SUM(debit_amount) - SUM(credit_amount))
    - Filter:
        - ledger_account IN ('Purchase Account', 'Office Rent', 'Sales Account', 'Cash in Hand')
    - Group by ledger_account
    - Order doesn't matter
    
    If the query is about cash withdrawals this year:
    - Return:
        - date
        - debit_amount as withdrawal_amount
        - narration
    - Filter:
        - voucher_type = 'Sales'
        - ledger_account = 'Sales Account'
        - debit_amount > 0
        - date between 1st April and 31st March of the current financial year
    - Order by: date ascending



        

    Sales filter: voucher_type = 'Sales' AND ledger_account = 'Sales Account'
    Purchase filter: voucher_type = 'Purchase' AND ledger_account = 'Purchase Account'

    Table: transactions (columns: id, date, credit_amount, debit_amount, party_name, cgst_amount, sgst_amount, igst_amount, tds_amount, voucher_type, ledger_account)

    User Query: "{query}"

    Return only the SQL.
    """

        response = await self.client.chat.completions.create(
            model=self.model,
            messages=[{"role": "user", "content": prompt}],
            temperature=0
        )

        raw_sql = response.choices[0].message.content.strip()
        cleaned_sql = re.sub(r"^```(?:sql)?\s*|```$", "", raw_sql, flags=re.IGNORECASE | re.MULTILINE).strip()

        # Enforce safety
        if any(keyword in cleaned_sql.lower() for keyword in ["drop ", "delete ", "truncate ", "update "]):
            raise ValueError("Unsafe SQL operation detected.")

        print("🧠 Final SQL executed:\n", cleaned_sql)

        try:
            result = db.execute(text(cleaned_sql)).mappings().all()
        except Exception as e:
            return {"error": str(e), "sql": cleaned_sql}

        # Query 2: Month-wise sales
        if result and "month" in result[0] and "monthly_sales" in result[0]:
            monthly_data = [
                (row["month"], float(row["monthly_sales"] or 0))  # handles None
                for row in result
            ]
            monthly_data.sort()

            def format_month(ym):
                year, month = map(int, ym.split('-'))
                return f"{month_name[month]} {year}"

            comparison = {
                format_month(m): f"₹{s:,.0f}"
                for m, s in monthly_data
            }

            growth = {}
            for i in range(1, len(monthly_data)):
                prev, curr = monthly_data[i - 1], monthly_data[i]
                rate = ((curr[1] - prev[1]) / prev[1]) * 100 if prev[1] else 0
                growth[f"{format_month(curr[0])} vs {format_month(prev[0])}"] = f"{rate:+.2f}%"

            return {
                "Month-wise Sales Comparison": comparison,
                "Growth Rate": growth
            }

        # Query 3: Top customers
        if result and "total_purchase" in result[0] and "party_name" in result[0]:
            # Null-safe conversion
            top_5 = sorted(result, key=lambda r: float(r.get("total_purchase") or 0), reverse=True)[:5]

            month_match = re.search(r'in (\w+)(?: (\d{4}))?', query, re.IGNORECASE)
            if month_match:
                q_month = month_match.group(1).capitalize()
                q_year = month_match.group(2) or str(current_year)
            else:
                q_month = datetime.now().strftime("%B")
                q_year = str(current_year)

            top_customer = top_5[0]
            top_summary = f"{top_customer['party_name']} - ₹{float(top_customer.get('total_purchase') or 0):,.0f}"

            top_list = [
                f"{i+1}. {row['party_name']}: ₹{float(row.get('total_purchase') or 0):,.0f}"
                for i, row in enumerate(top_5)
            ]

            return {
                f"Top customer in {q_month} {q_year}": top_summary,
                "Top 5 customers": top_list
            }


        # ✅ Query 4: Total purchases
        if result and "total_purchases" in result[0] and "party_name" in result[0]:
            suppliers = []
            total_purchases = 0
            total_gst = 0
            total_tds = 0

            for row in result:
                suppliers.append({
                    "party": row["party_name"],
                    "amount": float(row.get("total_purchases") or 0)
                })
                total_purchases += float(row.get("total_purchases") or 0)
                total_gst += float(row.get("total_gst") or 0)
                total_tds += float(row.get("total_tds") or 0)

            return {
                "Total purchases": f"₹{total_purchases:,.0f}",
                "Breakdown by supplier": suppliers,
                "GST paid": f"₹{total_gst:,.0f}",
                "TDS deducted": f"₹{total_tds:,.0f}"
            }
        
        # ✅ Query 5: Office rent payments this year
        if result and "total_rent" in result[0] and "payment_count" in result[0] and "office rent" in query.lower():
            row = result[0]
            total_rent = float(row["total_rent"] or 0)
            payment_count = int(row["payment_count"] or 0)
            monthly_rent = total_rent / payment_count if payment_count else 0

            fy_label = f"{fy_start.strftime('%b %Y')} - {fy_end.strftime('%b %Y')}"
            return {
                f"Office rent payments ({fy_label})": f"₹{total_rent:,.0f}",
                "Monthly rent": f"₹{monthly_rent:,.0f}",
                "Payment method": "Bank transfer",
                "Cost center": "Admin Department"
            }
        
        # ✅ Query 6: Top Expense Categories
        if result and "ledger_account" in result[0] and "total_expense" in result[0] and "percentage" in result[0] and "expense" in query.lower():
            formatted = []
            for i, row in enumerate(result, start=1):
                account = row["ledger_account"]
                amount = float(row["total_expense"])
                pct = float(row["percentage"])
                formatted.append(f"{i}. {account}: ₹{amount:,.0f} ({pct:.1f}%)")

            fy_label = f"{fy_start.strftime('%b %Y')} - {fy_end.strftime('%b %Y')}"
            return {
                f"Top expense categories ({fy_label})": formatted
            }
        
        # ✅ Query 7: GST Liability
        if result and "gst_type" in result[0] and "cgst" in result[0] and "sgst" in result[0] and "igst" in result[0] and "gst" in query.lower():
            output_gst = next((r for r in result if r["gst_type"] == "Output GST"), {})
            input_gst = next((r for r in result if r["gst_type"] == "Input GST"), {})

            # Convert and handle None
            out_cgst = float(output_gst.get("cgst") or 0)
            out_sgst = float(output_gst.get("sgst") or 0)
            out_igst = float(output_gst.get("igst") or 0)
            in_cgst = float(input_gst.get("cgst") or 0)
            in_sgst = float(input_gst.get("sgst") or 0)
            in_igst = float(input_gst.get("igst") or 0)

            output_total = out_cgst + out_sgst + out_igst
            input_total = in_cgst + in_sgst + in_igst
            net_payable = output_total - input_total

            # Month parsing from query
            month_match = re.search(r'for (\w+) (\d{4})', query, re.IGNORECASE)
            if month_match:
                q_month = month_match.group(1).capitalize()
                q_year = month_match.group(2)
            else:
                now = datetime.now()
                q_month = now.strftime("%B")
                q_year = now.year

            return {
                f"GST Liability for {q_month} {q_year}": f"Output GST (Sales): ₹{output_total:,.0f}",
                "Output GST (Sales)": {
                    "CGST": f"₹{out_cgst:,.0f}",
                    "SGST": f"₹{out_sgst:,.0f}",
                    "IGST": f"₹{out_igst:,.0f}"
                },
                "Input GST (Purchases)": {
                    "Total": f"₹{input_total:,.0f}",
                    "CGST": f"₹{in_cgst:,.0f}",
                    "SGST": f"₹{in_sgst:,.0f}",
                    "IGST": f"₹{in_igst:,.0f}"
                },
                "Net GST Payable": f"₹{net_payable:,.0f}"
            }
        
        # ✅ Query 8: TDS Deducted from Vendors
        if result and "tds_section" in result[0] and "total_tds" in result[0] and "tds" in query.lower():
            tds_by_section = []
            total_tds = 0

            for row in result:
                section = row["tds_section"] or "Unknown"
                amount = float(row["total_tds"] or 0)
                tds_by_section.append((section, amount))
                total_tds += amount

            monthly_avg = total_tds / 12 if total_tds else 0

            response = {
                "TDS Deducted (Apr 2024 - Mar 2025)": {
                    sec: f"₹{amt:,.0f}" for sec, amt in tds_by_section
                },
                "Total TDS": f"₹{total_tds:,.0f}",
                "Monthly average": f"₹{monthly_avg:,.0f}"
            }

            return response
        
        # Query 9: IGST Transactions
        if result and "igst_amount" in result[0] and "voucher_type" in result[0]:
            igst_paid = 0
            igst_collected = 0
            summary = []

            for row in result:
                party = row["party_name"]
                amount = float(row["igst_amount"] or 0)
                narration = row.get("narration", "")
                vtype = row["voucher_type"]

                summary.append(f"{party} - {narration}: ₹{amount:,.0f} IGST")

                if vtype.lower() == "purchase":
                    igst_paid += amount
                elif vtype.lower() == "sales":
                    igst_collected += amount

            net_igst = igst_collected - igst_paid
            return {
                "IGST Transactions (Interstate/Export)": summary,
                "Total IGST collected": f"₹{igst_collected:,.0f}",
                "Total IGST paid": f"₹{igst_paid:,.0f}",
                "Net IGST position": f"₹{net_igst:,.0f} {'(Payable)' if net_igst > 0 else '(Refundable)'}"
            }
        
        # Query 10: Outstanding Balance for a Party
        if result and "outstanding_balance" in result[0] and "party_name" in result[0]:
            party = result[0]["party_name"]
            outstanding_balance = float(result[0]["outstanding_balance"] or 0)

            # Fetch latest sales invoice
            latest_invoice = db.execute(
                text("""
                    SELECT date, credit_amount
                    FROM transactions
                    WHERE party_name = :party
                    ORDER BY date DESC
                    LIMIT 1
                """),
                {"party": party}
            ).fetchone()

            # Fetch latest payment received
            latest_payment = db.execute(
                text("""
                    SELECT date, debit_amount
                    FROM transactions
                    WHERE party_name = :party
                    AND debit_amount > 0
                    ORDER BY date DESC
                    LIMIT 1
                """),
                {"party": party}
            ).fetchone()

            # Fetch party master data
            party_info = db.execute(
                text("""
                    SELECT gstin, payment_terms
                    FROM party_master
                    WHERE name = :party
                """),
                {"party": party}
            ).fetchone()

            invoice_str = f"{latest_invoice.date.strftime('%d-%b-%Y')}" if latest_invoice else "N/A"
            payment_str = (
                f"₹{latest_payment.debit_amount:,.0f} ({latest_payment.date.strftime('%d-%b-%Y')})"
                if latest_payment else "N/A"
            )

            return {
                f"{party} - Outstanding Analysis": {
                    "Total Sales": f"₹{latest_invoice.credit_amount:,.0f} ({invoice_str})" if latest_invoice else "N/A",
                    "Payments Received": payment_str,
                    "Current Outstanding": f"₹{outstanding_balance:,.0f}",
                    "Payment Terms": party_info.payment_terms if party_info else "N/A",
                    "GSTIN": party_info.gstin if party_info else "N/A"
                }
            }

        # Query 11: Top 5 Suppliers by Purchase Value
        if result and "total_purchase_value" in result[0] and "percentage" in result[0]:
            supplier_summary = []
            total_purchase = sum(float(r["total_purchase_value"] or 0) for r in result)

            for idx, row in enumerate(result, start=1):
                supplier_summary.append(
                    f"{idx}. {row['party_name']}: ₹{float(row['total_purchase_value']):,.0f} ({float(row['percentage']):.1f}%)"
                )

            return {
                "Top 5 Suppliers (Apr 2024 - Mar 2025)": supplier_summary,
                "Total Purchase Value": f"₹{total_purchase:,.0f}"
            }
        
       # --- Query 12: Customers by Branch ---
        if result and "total_sales" in result[0] and "party_name" in result[0]:
            branch = result[0].get("branch", "").replace(" Branch", "") or "Selected"
            customer_summary = []
            total_branch_sales = sum(float(r["total_sales"] or 0) for r in result)

            # Optionally get total sales for percentage calculation
            total_sales_result = db.execute(
                text("""
                    SELECT SUM(credit_amount) as total_sales
                    FROM transactions
                    WHERE voucher_type = 'Sales'
                    AND ledger_account = 'Sales Account'
                """)
            ).fetchone()

            total_sales = float(total_sales_result.total_sales or 0) if total_sales_result else 0
            branch_sales_pct = (total_branch_sales * 100 / total_sales) if total_sales else 0

            for idx, row in enumerate(result, start=1):
                customer_summary.append(
                    f"{idx}. {row['party_name']} - GSTIN: {row.get('gstin_party', 'N/A')}\n   Total Sales: ₹{float(row['total_sales']):,.0f}"
                )

            return {
                f"{branch} Branch Customers": customer_summary,
                "Total Sales": f"₹{total_branch_sales:,.0f} ({branch_sales_pct:.1f}% of total sales)"
            }

        elif not result and "customers" in query.lower() and "branch" in query.lower():
            # Use a fallback or pass `branch_name` dynamically when available
            branch = query.lower().split("from")[-1].strip().title().replace(" Branch", "") if "from" in query.lower() else "Selected"
            return {
                "message": f"No customers found for {branch} Branch."
            }

        # --- Query 13: Current Bank or Cash Balances ---
        if (
            "current bank" in query.lower() or
            "cash balances" in query.lower() or
            "cash balance" in query.lower()
        ):
            if not result:
                return {
                    "message": "No bank or cash balances found for the specified accounts."
                }

            if result and "ledger_account" in result[0] and "current_balance" in result[0]:
                balances = {}
                total_assets = 0.0

                for row in result:
                    account = row["ledger_account"]
                    balance = float(row.get("current_balance", 0) or 0)
                    balances[account] = f"₹{balance:,.0f}"
                    total_assets += balance

                return {
                    "Current Bank Balances (as of Mar 31, 2024)": balances,
                    "Total Liquid Assets": f"₹{total_assets:,.0f}"
                }

            return {
                "message": "Unexpected result format for bank balances."
            }
      
        







        # Default: Query 1 – Total sales with GST and breakdown
        summary = {
            "total_sales": 0,
            "total_gst": 0,
            "parties": [],
            "gst_breakdown": {"cgst": 0, "sgst": 0, "igst": 0}
        }

        for row in result:
            row_dict = dict(row)

            if "party_name" in row_dict:
                amount = (
                    row_dict.get("total_sales_per_party") or
                    row_dict.get("total_sales_amount") or
                    row_dict.get("credit_amount") or 0
                )
                summary["parties"].append({
                    "party": row_dict["party_name"],
                    "amount": float(amount)
                })

            summary["total_sales"] += float(row_dict.get("total_sales_amount") or row_dict.get("credit_amount") or 0.0)


            summary["gst_breakdown"]["cgst"] += float(row_dict.get("cgst_amount") or 0)
            summary["gst_breakdown"]["sgst"] += float(row_dict.get("sgst_amount") or 0)
            summary["gst_breakdown"]["igst"] += float(row_dict.get("igst_amount") or 0)

        summary["total_gst"] = sum(summary["gst_breakdown"].values())

        return {
            "Total sales": f"₹{summary['total_sales']:,.2f}",
            "Breakdown": summary["parties"],
            "GST collected": {
                "Total": f"₹{summary['total_gst']:,.2f}",
                "CGST": f"₹{summary['gst_breakdown']['cgst']:,.2f}",
                "SGST": f"₹{summary['gst_breakdown']['sgst']:,.2f}",
                "IGST": f"₹{summary['gst_breakdown']['igst']:,.2f}",
            }
        }









# Initialize the service (ensure settings are loaded before this)
openai_service = OpenAIService()