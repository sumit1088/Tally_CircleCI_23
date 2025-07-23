from pydantic import BaseModel
from datetime import date

class AuditLogBase(BaseModel):
    action: str
    entity: str
    entity_id: int
    user_id: str
    timestamp: date

class AuditLogCreate(AuditLogBase):
    pass

class AuditLog(AuditLogBase):
    id: int
    class Config:
        orm_mode = True

class LedgerNoteBase(BaseModel):
    ledger_id: int
    note: str
    created_at: date

class LedgerNoteCreate(LedgerNoteBase):
    pass

class LedgerNote(LedgerNoteBase):
    id: int
    class Config:
        orm_mode = True