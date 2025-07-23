from sqlalchemy.orm import Session
from app.models.ledger_account import LedgerAccount
from app.schemas.ledger_account import LedgerAccountCreate

def create_ledger_account(db: Session, obj: LedgerAccountCreate):
    record = LedgerAccount(**obj.dict())
    db.add(record)
    db.commit()
    db.refresh(record)
    return record

def get_all_ledger_accounts(db: Session):
    return db.query(LedgerAccount).all()
