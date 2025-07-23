from contextlib import asynccontextmanager
from databases import Database

USER_DB_MAP = {
    "user_1": "postgresql://postgres:root@db:5432/tally_db_1",
    "user_2": "postgresql://postgres:root@db:5432/tally_db_2"
}

@asynccontextmanager
async def get_db_by_user_id(user_id: str):
    db_url = USER_DB_MAP.get(user_id)
    if not db_url:
        raise Exception(f"Unknown user or database mapping for user_id: {user_id}")

    db = Database(db_url)
    await db.connect()
    try:
        yield db
    finally:
        await db.disconnect()
