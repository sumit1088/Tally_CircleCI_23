from sqlalchemy import (
    Column, Integer, Text, Boolean, ForeignKey,
    JSON, ARRAY, TIMESTAMP, Float
)
from sqlalchemy.dialects.postgresql import JSONB
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.models.base import BaseModel
from pgvector.sqlalchemy import Vector

class Conversation(BaseModel):
    __tablename__ = "conversations"

    user_id = Column(Integer, nullable=False)
    title = Column(Text, nullable=True)
    created_at = Column(TIMESTAMP(timezone=True), server_default=func.now())

class QueryHistory(BaseModel):
    __tablename__ = "query_history"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    conversation_id = Column(Integer, ForeignKey("conversations.id"), nullable=False)
    query_text = Column(Text, nullable=False) 
    #query_embedding = Column(Vector(1536), nullable=False)
    category_id = Column(ARRAY(Integer))  
    document_id = Column(ARRAY(Integer))  # array of related document IDs
    top_k = Column(Integer)               # top K documents/chunks retrieved
    distance_threshold = Column(Float)    # for embedding search filtering
    chunk_ids = Column(ARRAY(Integer))    # array of matched chunk IDs

    response_text = Column(Text)          # full response
    history_summary = Column(Text)        # brief summary
    #response_embedding = Column(Vector(1536))  # embedding of response
    query_result = Column(JSONB)               # raw response in JSON format

    created_at = Column(TIMESTAMP, server_default=func.now())
    updated_at = Column(TIMESTAMP, server_default=func.now(), onupdate=func.now())
    is_deleted = Column(Boolean, default=False)

    
class Message(BaseModel):
    __tablename__ = "message"

    conversation_id = Column(Integer, ForeignKey("conversations.id"), nullable=False)
    user_id = Column(Integer, nullable=False)
    query_id = Column(Integer, ForeignKey("query_history.id"), nullable=True)
    query_text = Column(Text, nullable=False)
    document_ids = Column(ARRAY(Integer))
    category_ids = Column(ARRAY(Integer))
    chunk_ids = Column(ARRAY(Integer))
    top_k = Column(Integer)
    distance_threshold = Column(Float)
    response_text = Column(Text, nullable=False)
    history_summary = Column(Text)
    created_at = Column(TIMESTAMP, server_default=func.now())
