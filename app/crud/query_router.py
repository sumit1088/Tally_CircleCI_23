from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import insert
from app.models.query_router import QueryResponse
from typing import Optional
from datetime import datetime
import uuid
from datetime import datetime
import uuid
import logging
import hashlib

# async def create_query_response(
#     db: AsyncSession,
#     user_id: str,
#     success: str,
#     query: str,
#     result: Optional[dict] = None,
#     summary: Optional[str] = None,
#     executed_at: Optional[datetime] = None,
# ):
#     stmt = insert(QueryResponse.__table__).values(
#         id=uuid.uuid4(),
#         user_id=user_id,
#         success=success,
#         query=query,
#         result=result,
#         summary=summary,
#         executed_at=executed_at or datetime.utcnow(),
#     )

#     await db.execute(stmt)
#     await db.commit()  

def compute_prompt_checksum(prompt: str) -> str:
    return hashlib.sha256(prompt.encode("utf-8")).hexdigest()


async def create_query_response(
    db,  # This is `databases.Database`
    user_id: str,
    success: str,
    query: str,
    prompt: str,
    result: Optional[dict] = None,
    summary: Optional[str] = None,
    executed_at: Optional[datetime] = None,
):
    try:
        # stmt = QueryResponse.__table__.insert()
        # values = {
        #     "id": str(uuid.uuid4()),
        #     "user_id": user_id,
        #     "success": success,
        #     "query": query,
        #     "prompt": prompt,
        #     "result": result,
        #     "summary": summary,
        #     "executed_at": executed_at or datetime.utcnow(),
        # }

        # await db.execute(query=stmt, values=values)
        # logging.info( "Data is stored inside DB")

        checksum = compute_prompt_checksum(prompt)
        # Check if exists
        existing = await db.fetch_one(
            QueryResponse.__table__.select().where(
                (QueryResponse.user_id == user_id) &
                (QueryResponse.checksum == checksum)
            )
        )
        if existing:
            # Update executed_at
            await db.execute(
                QueryResponse.__table__.update()
                .where((QueryResponse.user_id == user_id) & (QueryResponse.checksum == checksum))
                .values(executed_at=executed_at or datetime.utcnow())
            )
        else:
            # Insert new
            values = {
                "id": str(uuid.uuid4()),
                "user_id": user_id,
                "success": success,
                "query": query,
                "prompt": prompt,
                "result": result,
                "summary": summary,
                "executed_at": executed_at or datetime.utcnow(),
                "checksum": checksum,
            }
            await db.execute(query=QueryResponse.__table__.insert(), values=values)

    except Exception:
        logging.exception("Error while inserting into query_response")