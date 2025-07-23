from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from pydantic import BaseModel
from app.api import deps
from app.utils.openai_services import OpenAIService

router = APIRouter()
openai_service = OpenAIService()

class QueryRequest(BaseModel):
    query: str

@router.post("/interpret", tags=["Query Interpreter"])
async def interpret_query(request: QueryRequest, db: Session = Depends(deps.get_db)):
    try:
        response = await openai_service.interpret_query_with_openai(request.query, db)
        return response
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
