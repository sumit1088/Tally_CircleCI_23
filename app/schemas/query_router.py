from pydantic import BaseModel, Field
from typing import Optional, List, Any
from datetime import datetime
import uuid

class QueryResponseSchema(BaseModel):
    id: Optional[uuid.UUID]
    user_id: str
    success: str
    query: str
    prompt: Optional[str]
    result: Optional[Any]
    summary: Optional[str]
    executed_at: Optional[datetime]
    checksum: str

    class Config:
        orm_mode = True

class QueryRequest(BaseModel):
    user_id: str
    prompt: str

class QueryHistoryResponse(BaseModel):
    id: uuid.UUID
    user_id: str
    prompt: Optional[str]
    query: str
    result: Optional[Any]
    summary: Optional[str]
    executed_at: datetime

    class Config:
        orm_mode = True