from pydantic import BaseModel

class VoucherTypeBase(BaseModel):
    name: str

class VoucherTypeCreate(VoucherTypeBase):
    pass

class VoucherType(VoucherTypeBase):
    id: int

    class Config:
        orm_mode = True
