from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import insert
from app.models.query_router import QueryResponse
from typing import Optional
from datetime import datetime
import uuid
from databases import Database
import uuid
import logging
import hashlib

import logging

logger = logging.getLogger(__name__)

async def get_user_query_history(db: Database, user_id: str):
    if not isinstance(db, Database):
        raise TypeError(f"Expected 'db' to be a Database instance, got {type(db)}")

    query = QueryResponse.__table__.select().where(
        QueryResponse.user_id == user_id
    ).order_by(QueryResponse.executed_at.desc())

    rows = await db.fetch_all(query)
    logger.debug(f"Fetched {len(rows)} history entries for user {user_id}")
    return rows
