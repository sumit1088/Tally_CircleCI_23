from pydantic import BaseModel
from datetime import date

class ProjectBase(BaseModel):
    name: str
    client: str
    start_date: date
    end_date: date
    status: str

class ProjectCreate(ProjectBase):
    pass

class Project(ProjectBase):
    id: int
    class Config:
        orm_mode = True

class ProjectAllocationBase(BaseModel):
    voucher_id: int
    project_id: int
    amount: float

class ProjectAllocationCreate(ProjectAllocationBase):
    pass

class ProjectAllocation(ProjectAllocationBase):
    id: int
    class Config:
        orm_mode = True