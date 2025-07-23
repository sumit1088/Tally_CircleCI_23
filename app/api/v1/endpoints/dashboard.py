# app/api/routes/dashboard.py
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import Generator

from app.db.multi_tenant import get_db_for_user
from app.services.dashboard_service import get_dashboard_data
from app.schemas.dashboard_schemas import DashboardResponse

router = APIRouter()

# ---------------------------------------------------------------- dependency (fixed to user_2)
def tenant_session_user2() -> Generator[Session, None, None]:
    """
    Always yields a Session bound to the `tally_db_2` database
    (mapped to hard‑coded user_id = "user_2").
    """
    session_gen = get_db_for_user("user_2")()   # ← hard‑coded
    try:
        db: Session = next(session_gen)         # open Session
        yield db
    finally:
        # close Session even if an exception occurred
        try:
            next(session_gen)
        except StopIteration:
            pass

# ---------------------------------------------------------------- route (no path param now)
@router.get("/dashboard", response_model=DashboardResponse)
def dashboard_handler(db: Session = Depends(tenant_session_user2)):
    """
    Always serves data from tally_db_2.
    """
    return get_dashboard_data(db)
