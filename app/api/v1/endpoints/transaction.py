from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.schemas.transaction import Transaction, TransactionCreate
from app.crud.crud_transaction import create_transaction, get_transaction, get_all_transactions
from app.db.session import SessionLocal

# ✅ Removed prefix and tags here
router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/", response_model=Transaction)
def create(tx: TransactionCreate, db: Session = Depends(get_db)):
    return create_transaction(db, tx)

@router.get("/", response_model=list[Transaction])
def read_all(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return get_all_transactions(db, skip, limit)

@router.get("/{tx_id}", response_model=Transaction)
def read_by_id(tx_id: int, db: Session = Depends(get_db)):
    return get_transaction(db, tx_id)
