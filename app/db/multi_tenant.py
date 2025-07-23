# app/db/multi_tenant.py
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from typing import Generator

USER_DB_MAP = {
    "user_1": "postgresql://postgres:root@db:5432/tally_db_1",
    "user_2": "postgresql://postgres:root@db:5432/tally_db_2",
}

_engine_cache = {}

def get_db_for_user(user_id: str):
    db_url = USER_DB_MAP.get(user_id)
    if not db_url:
        raise ValueError(f"Unknown user_id: {user_id}")
    
    if db_url not in _engine_cache:
        engine = create_engine(db_url)
        _engine_cache[db_url] = sessionmaker(bind=engine)

    SessionLocal = _engine_cache[db_url]

    def get_session() -> Generator[Session, None, None]:
        db = SessionLocal()
        try:
            yield db
        finally:
            db.close()

    return get_session
