from sqlalchemy.orm import Session
from app.models.cost_center import CostCenter
from app.schemas.cost_center import CostCenterCreate

def create_cost_center(db: Session, obj: CostCenterCreate):
    record = CostCenter(**obj.dict())
    db.add(record)
    db.commit()
    db.refresh(record)
    return record

def get_all_cost_centers(db: Session):
    return db.query(CostCenter).all()
