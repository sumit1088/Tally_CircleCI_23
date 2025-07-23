import hashlib

def compute_prompt_hash(prompt: str, db_schema: str) -> str:
    combined = (prompt.strip() + db_schema.strip()).encode("utf-8")
    return hashlib.sha256(combined).hexdigest()
