from app.models.base import BaseModel
from sqlalchemy import (
    Column, Integer, String, Boolean, DateTime, BigInteger, Text, ForeignKey,
    JSON, ARRAY, Date, Numeric
)
from sqlalchemy.orm import relationship
from datetime import datetime

class LedgerAccount(BaseModel):
    __tablename__ = "ledger_accounts"

    id = Column(Integer, primary_key=True)
    name = Column(String, unique=True)
    parent_id = Column(Integer, ForeignKey("ledger_accounts.id"), nullable=True)
