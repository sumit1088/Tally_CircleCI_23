from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.schemas.inventory import Inventory, InventoryCreate
from app.crud.crud_inventory import create_inventory_item, get_all_inventory
from app.db.session import SessionLocal

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/", response_model=Inventory)
def create(obj: InventoryCreate, db: Session = Depends(get_db)):
    return create_inventory_item(db, obj)

@router.get("/", response_model=list[Inventory])
def read_all(db: Session = Depends(get_db)):
    return get_all_inventory(db)
