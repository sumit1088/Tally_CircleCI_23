# app/utils/embedding.py

import openai
from app.core.config import settings

openai.api_key = settings.OPENAI_API_KEY

def get_embedding(text: str) -> list[float]:
    response = openai.embeddings.create(
        input=text,
        model="text-embedding-3-small"
    )
    return response.data[0].embedding
