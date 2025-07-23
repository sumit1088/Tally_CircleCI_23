from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.schemas.ledger_account import LedgerAccount, LedgerAccountCreate
from app.crud.crud_ledger_account import create_ledger_account, get_all_ledger_accounts
from app.db.session import SessionLocal

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/", response_model=LedgerAccount)
def create(obj: LedgerAccountCreate, db: Session = Depends(get_db)):
    return create_ledger_account(db, obj)

@router.get("/", response_model=list[LedgerAccount])
def read_all(db: Session = Depends(get_db)):
    return get_all_ledger_accounts(db)
