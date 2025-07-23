from sqlalchemy.orm import Session
from app.models.inventory import Inventory
from app.schemas.inventory import InventoryCreate

def create_inventory_item(db: Session, obj: InventoryCreate):
    record = Inventory(**obj.dict())
    db.add(record)
    db.commit()
    db.refresh(record)
    return record

def get_all_inventory(db: Session):
    return db.query(Inventory).all()
