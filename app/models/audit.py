from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey, Text
from sqlalchemy.orm import relationship
from app.models.base import BaseModel

class AuditLog(BaseModel):
    __tablename__ = 'audit_logs'
    id = Column(Integer, primary_key=True)
    action = Column(String)
    entity = Column(String)
    entity_id = Column(Integer)
    user_id = Column(String)
    timestamp = Column(Date)

class LedgerNote(BaseModel):
    __tablename__ = 'ledger_notes'
    id = Column(Integer, primary_key=True)
    ledger_id = Column(Integer, ForeignKey('ledgers.id'))
    note = Column(Text)
    created_at = Column(Date)
