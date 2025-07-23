from pydantic import BaseModel

class TaxInformationBase(BaseModel):
    tax_type: str
    rate: float
    applicable_on: str

class TaxInformationCreate(TaxInformationBase):
    pass

class TaxInformation(TaxInformationBase):
    id: int

    class Config:
        orm_mode = True
