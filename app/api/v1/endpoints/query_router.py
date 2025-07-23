from fastapi import APIRouter, Depends
from pydantic import BaseModel
from app.services.query_engine import execute_sql_query


router = APIRouter()

class QueryRequest(BaseModel):
    user_id: str
    prompt: str

@router.post("/query")
async def handle_query(req: QueryRequest):
    result = await execute_sql_query(user_id=req.user_id, prompt=req.prompt)
    return result
