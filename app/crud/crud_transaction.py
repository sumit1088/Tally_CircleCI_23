from sqlalchemy.orm import Session
from app.models.transaction import Transaction
from app.schemas.transaction import TransactionCreate

def create_transaction(db: Session, tx: TransactionCreate):
    db_tx = Transaction(**tx.dict())
    db.add(db_tx)
    db.commit()
    db.refresh(db_tx)
    return db_tx

def get_transaction(db: Session, tx_id: int):
    return db.query(Transaction).filter(Transaction.id == tx_id).first()

def get_all_transactions(db: Session, skip=0, limit=100):
    return db.query(Transaction).offset(skip).limit(limit).all()
