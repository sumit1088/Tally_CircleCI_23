from pydantic import BaseModel
from typing import Optional
from datetime import date

class TransactionBase(BaseModel):
    date: date
    voucher_type: str
    ledger_account: str
    party_name: Optional[str]
    credit_amount: Optional[float]
    debit_amount: Optional[float]
    cgst_amount: Optional[float]
    sgst_amount: Optional[float]
    igst_amount: Optional[float]
    tds_amount: Optional[float]

class TransactionCreate(TransactionBase):
    pass

class Transaction(TransactionBase):
    id: int

    class Config:
        orm_mode = True
