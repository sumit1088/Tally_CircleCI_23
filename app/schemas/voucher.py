from pydantic import BaseModel
from typing import Optional
from datetime import date

class VoucherTypeBase(BaseModel):
    name: str

class VoucherTypeCreate(VoucherTypeBase):
    pass

class VoucherType(VoucherTypeBase):
    id: int
    class Config:
        orm_mode = True

class VoucherBase(BaseModel):
    date: date
    ledger_id: int
    voucher_type_id: int
    amount: float
    narration: Optional[str] = None
    cgst: float = 0
    sgst: float = 0
    igst: float = 0
    is_export: bool = False
    ref_no: Optional[str] = None
    invoice_no: Optional[str] = None

class VoucherCreate(VoucherBase):
    pass

class Voucher(VoucherBase):
    id: int

    class Config:
        orm_mode = True
