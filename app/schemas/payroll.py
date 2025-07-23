from pydantic import BaseModel
from datetime import date

class EmployeeBase(BaseModel):
    name: str
    designation: str
    department: str
    contact: str
    doj: date

class EmployeeCreate(EmployeeBase):
    pass

class Employee(EmployeeBase):
    id: int
    class Config:
        orm_mode = True

class SalaryLedgerBase(BaseModel):
    employee_id: int
    month: str
    year: int
    gross_salary: float
    deductions: float
    net_pay: float

class SalaryLedgerCreate(SalaryLedgerBase):
    pass

class SalaryLedger(SalaryLedgerBase):
    id: int
    class Config:
        orm_mode = True