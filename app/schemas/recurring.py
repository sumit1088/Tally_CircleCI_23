from pydantic import BaseModel
from datetime import date

class RecurringTemplateBase(BaseModel):
    name: str
    interval: str
    last_run: date

class RecurringTemplateCreate(RecurringTemplateBase):
    pass

class RecurringTemplate(RecurringTemplateBase):
    id: int
    class Config:
        orm_mode = True

class RecurringVoucherBase(BaseModel):
    template_id: int
    voucher_id: int

class RecurringVoucherCreate(RecurringVoucherBase):
    pass

class RecurringVoucher(RecurringVoucherBase):
    id: int
    class Config:
        orm_mode = True
