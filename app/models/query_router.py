from sqlalchemy import Column, String, Text, DateTime, JSON
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.sql import func
import uuid
from app.models.base import BaseModel

class QueryResponse(BaseModel):
    __tablename__ = "query_response"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(String, nullable=False)
    success = Column(String, nullable=False)
    query = Column(Text, nullable=False)
    prompt = Column(Text, nullable=True)
    result = Column(JSON, nullable=True)
    summary = Column(Text, nullable=True)
    executed_at = Column(DateTime(timezone=True), server_default=func.now())
    checksum = Column(String, nullable=False, index=True) 