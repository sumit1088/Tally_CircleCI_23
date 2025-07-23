from sentence_transformers import SentenceTransformer, util
from sqlalchemy.sql import text
from sentence_transformers.util import pytorch_cos_sim

nlp_model = SentenceTransformer("all-MiniLM-L6-v2")

# async def extract_schema_relevant_to_prompt(db, prompt: str) -> str:
#     tables = await db.fetch_all("""
#         SELECT table_name FROM information_schema.tables 
#         WHERE table_schema = 'public'
#     """)

#     prompt_embedding = nlp_model.encode(prompt, convert_to_tensor=True)
#     relevant_schema = ""
#     matched_any = False

#     for table_row in tables:
#         table_name = table_row["table_name"]

#         columns = await db.fetch_all("""
#             SELECT column_name, data_type 
#             FROM information_schema.columns 
#             WHERE table_name = :table
#         """, {"table": table_name})

#         column_names = ", ".join(col["column_name"] for col in columns)
#         table_desc = f"{table_name}: {column_names}"
#         table_embedding = nlp_model.encode(table_desc, convert_to_tensor=True)
#         similarity = util.pytorch_cos_sim(prompt_embedding, table_embedding).item()

#         print(f"🔍 Checking table '{table_name}' → similarity: {similarity:.2f}")

#         if similarity >= 0.45:
#             matched_any = True
#             relevant_schema += f"\nTable: {table_name}\n"
#             for col in columns:
#                 relevant_schema += f"  - {col['column_name']}: {col['data_type']}\n"

#     if not matched_any:
#         print("⚠️ No schema matched. Returning full schema.")
#         for table_row in tables:
#             table_name = table_row["table_name"]
#             columns = await db.fetch_all("""
#                 SELECT column_name, data_type 
#                 FROM information_schema.columns 
#                 WHERE table_name = :table
#             """, {"table": table_name})
#             relevant_schema += f"\nTable: {table_name}\n"
#             for col in columns:
#                 relevant_schema += f"  - {col['column_name']}: {col['data_type']}\n"

#     return relevant_schema.strip()

async def extract_schema_relevant_to_prompt(db, prompt: str) -> str:
    prompt_embedding = nlp_model.encode(prompt, convert_to_tensor=True)
    tables = await db.fetch_all("""
        SELECT table_name FROM information_schema.tables 
        WHERE table_schema = 'public'
    """)

    relevant_schema = ""
    matched_any = False

    for table_row in tables:
        table_name = table_row["table_name"]
        columns = await db.fetch_all("""
            SELECT column_name, data_type 
            FROM information_schema.columns 
            WHERE table_name = :table
        """, {"table": table_name})

        column_names_str = ", ".join(col["column_name"] for col in columns)
        table_summary = f"{table_name}: {column_names_str}"
        table_embedding = nlp_model.encode(table_summary, convert_to_tensor=True)
        table_similarity = pytorch_cos_sim(prompt_embedding, table_embedding).item()

        if table_similarity >= 0.4:
            matched_any = True
            relevant_schema += f"\nTable: {table_name}\n"
            for col in columns:
                col_desc = f"{table_name}.{col['column_name']}: {col['data_type']}"
                col_embedding = nlp_model.encode(col_desc, convert_to_tensor=True)
                col_similarity = pytorch_cos_sim(prompt_embedding, col_embedding).item()
                if col_similarity >= 0.3:
                    relevant_schema += f"  - {col['column_name']}: {col['data_type']}\n"

    if not matched_any:
        for table_row in tables:
            table_name = table_row["table_name"]
            columns = await db.fetch_all("""
                SELECT column_name, data_type 
                FROM information_schema.columns 
                WHERE table_name = :table
            """, {"table": table_name})
            relevant_schema += f"\nTable: {table_name}\n"
            for col in columns:
                relevant_schema += f"  - {col['column_name']}: {col['data_type']}\n"

    return relevant_schema.strip()



