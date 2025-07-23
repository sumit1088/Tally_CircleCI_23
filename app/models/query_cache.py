# app/models/query_cache.py
from sqlalchemy import Column, String, Text, DateTime, JSON, ARRAY
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.sql import func
import uuid
from app.models.base import BaseModel

class QueryCache(BaseModel):
    __tablename__ = "query_cache"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(String, nullable=False)
    prompt = Column(Text, nullable=False)
    full_prompt = Column(Text, nullable=True)
    db_schema = Column(Text, nullable=False)
    generated_sql = Column(Text, nullable=False)
    sql_result = Column(JSON, nullable=True)
    summary = Column(Text, nullable=True)
    prompt_hash = Column(String, unique=True, nullable=False)
    executed_at = Column(DateTime(timezone=True), server_default=func.now())
    affected_tables = Column(ARRAY(String), default=["transactions"])
