from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from app.models.base import BaseModel

class Employee(BaseModel):
    __tablename__ = 'employees'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    designation = Column(String)
    department = Column(String)
    contact = Column(String)
    doj = Column(Date)

class SalaryLedger(BaseModel):
    __tablename__ = 'salary_ledger'
    id = Column(Integer, primary_key=True)
    employee_id = Column(Integer, ForeignKey('employees.id'))
    month = Column(String)
    year = Column(Integer)
    gross_salary = Column(Numeric)
    deductions = Column(Numeric)
    net_pay = Column(Numeric)
