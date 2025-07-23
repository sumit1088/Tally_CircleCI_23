from pydantic import BaseModel
from typing import Optional, Dict, Any
from datetime import datetime


class QueryCacheBase(BaseModel):
    user_id: str
    prompt: str
    db_schema: str  # ✅ Renamed to match SQLAlchemy model
    generated_sql: Optional[str] = None
    sql_result: Optional[Dict[str, Any]] = None
    summary: Optional[str] = None


class QueryCacheCreate(QueryCacheBase):
    pass


class QueryCache(QueryCacheBase):
    id: int
    executed_at: datetime

    class Config:
        orm_mode = True
