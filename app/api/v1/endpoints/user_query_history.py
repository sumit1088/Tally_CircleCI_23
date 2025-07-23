from fastapi import APIRouter, Query
from app.db.database import get_db_by_user_id
from app.services.user_query_history import fetch_user_query_history

router = APIRouter()

@router.get("/user-query-history")
async def query_history(user_id: str = Query(...)):
    async with get_db_by_user_id(user_id) as db:
        return await fetch_user_query_history(db, user_id)
