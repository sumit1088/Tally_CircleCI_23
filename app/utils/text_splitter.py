import tiktoken
from typing import List, Tuple

def split_into_chunks(text: str, max_tokens: int = 300, overlap: int = 50) -> List[Tuple[str, int]]:
    """
    Splits a text into overlapping token-based chunks suitable for embedding.

    Args:
        text (str): The input text to split.
        max_tokens (int): Maximum number of tokens per chunk.
        overlap (int): Number of overlapping tokens between chunks.

    Returns:
        List[Tuple[str, int]]: A list of tuples containing (chunk_text, token_count).
    """
    encoding = tiktoken.get_encoding("cl100k_base")  # Tokenizer used by OpenAI's models

    tokens = encoding.encode(text)
    chunks = []
    start = 0

    while start < len(tokens):
        end = min(start + max_tokens, len(tokens))
        chunk_tokens = tokens[start:end]
        chunk_text = encoding.decode(chunk_tokens)
        chunks.append((chunk_text, len(chunk_tokens)))
        start += max_tokens - overlap

    return chunks
