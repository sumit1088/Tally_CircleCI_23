from pydantic import BaseModel
from typing import Optional

class CostCenterBase(BaseModel):
    name: str
    department: Optional[str]
    project: Optional[str]

class CostCenterCreate(CostCenterBase):
    pass

class CostCenter(CostCenterBase):
    id: int

    class Config:
        orm_mode = True
