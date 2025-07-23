from pydantic import BaseModel

class LedgerBase(BaseModel):
    name: str
    party_name: str
    group_name: str
    gstin: str
    state: str
    contact: str

class LedgerCreate(LedgerBase):
    pass

class Ledger(LedgerBase):
    id: int

    class Config:
        orm_mode = True