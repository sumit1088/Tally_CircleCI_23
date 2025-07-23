from pydantic import BaseModel
from datetime import date

class TaxConfigBase(BaseModel):
    tax_type: str
    rate: float
    effective_date: date

class TaxConfigCreate(TaxConfigBase):
    pass

class TaxConfig(TaxConfigBase):
    id: int
    class Config:
        orm_mode = True
