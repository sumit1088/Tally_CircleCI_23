import logging
from app.crud.user_query_history import get_user_query_history

logger = logging.getLogger(__name__)

async def fetch_user_query_history(db, user_id: str):
    logger.info(f"Fetching query history for user_id={user_id}")
    history = await get_user_query_history(db, user_id)
    logger.info(f"Retrieved {len(history)} queries for user_id={user_id}")
    return history
