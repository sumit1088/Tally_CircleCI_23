from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.schemas.voucher_type import VoucherType, VoucherTypeCreate
from app.crud.crud_voucher_type import create_voucher_type, get_all_voucher_types
from app.db.session import SessionLocal

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/", response_model=VoucherType)
def create(obj: VoucherTypeCreate, db: Session = Depends(get_db)):
    return create_voucher_type(db, obj)

@router.get("/", response_model=list[VoucherType])
def read_all(db: Session = Depends(get_db)):
    return get_all_voucher_types(db)
