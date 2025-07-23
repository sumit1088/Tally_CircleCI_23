# app/api/v1/endpoints/search.py

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.db.session import get_db
from app.services.openai_service import interpret_query_with_openai
from app.core.config import settings

router = APIRouter()

@router.post("/query/")
async def run_natural_query(query: str, db: Session = Depends(get_db)):
    try:
        result = await interpret_query_with_openai(query, db)
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
