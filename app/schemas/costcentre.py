from pydantic import BaseModel

class CostCentreBase(BaseModel):
    name: str
    description: str

class CostCentreCreate(CostCentreBase):
    pass

class CostCentre(CostCentreBase):
    id: int
    class Config:
        orm_mode = True

class VoucherCostAllocationBase(BaseModel):
    voucher_id: int
    cost_centre_id: int
    amount: float

class VoucherCostAllocationCreate(VoucherCostAllocationBase):
    pass

class VoucherCostAllocation(VoucherCostAllocationBase):
    id: int
    class Config:
        orm_mode = True