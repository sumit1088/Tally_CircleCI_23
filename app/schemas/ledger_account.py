from pydantic import BaseModel
from typing import Optional

class LedgerAccountBase(BaseModel):
    name: str
    parent_id: Optional[int]

class LedgerAccountCreate(LedgerAccountBase):
    pass

class LedgerAccount(LedgerAccountBase):
    id: int

    class Config:
        orm_mode = True
