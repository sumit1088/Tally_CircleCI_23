from sqlalchemy.orm import Session
from app.models.voucher import VoucherType
from app.schemas.voucher_type import VoucherTypeCreate

def create_voucher_type(db: Session, obj: VoucherTypeCreate):
    record = VoucherType(**obj.dict())
    db.add(record)
    db.commit()
    db.refresh(record)
    return record

def get_all_voucher_types(db: Session):
    return db.query(VoucherType).all()
