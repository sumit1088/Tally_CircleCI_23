from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from app.models.base import BaseModel


class Project(BaseModel):
    __tablename__ = 'projects'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    client = Column(String)
    start_date = Column(Date)
    end_date = Column(Date)
    status = Column(String)

class ProjectAllocation(BaseModel):
    __tablename__ = 'project_allocations'
    id = Column(Integer, primary_key=True)
    voucher_id = Column(Integer, ForeignKey('vouchers.id'))
    project_id = Column(Integer, ForeignKey('projects.id'))
    amount = Column(Numeric)