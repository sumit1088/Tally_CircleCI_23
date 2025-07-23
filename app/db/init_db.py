from sqlalchemy.orm import Session
from app.db.base import Base
from app.db.session import engine
from app.crud import user as crud_user
from app.schemas.user import UserCreate, RoleCreate, UserRoleCreate
from app.core.config import settings
import logging
from sqlalchemy import text

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def init_db(db: Session) -> None:
    #db.execute(text("CREATE EXTENSION IF NOT EXISTS vector"))
    #db.commit()
    Base.metadata.create_all(bind=engine)

    roles = [
        RoleCreate(name="admin", description="Administrator"),
        RoleCreate(name="user", description="Regular user"),
        RoleCreate(name="pharmacist", description="Pharmacist"),
        RoleCreate(name="doctor", description="Doctor")
    ]

    for role in roles:
        try:
            crud_user.create_role(db, role_in=role)
            logger.info(f"Created role: {role.name}")
        except Exception as e:
            logger.warning(f"Role {role.name} already exists: {str(e)}")

    superuser = crud_user.get_user_by_email(db, email=settings.FIRST_SUPERUSER_EMAIL)
    if not superuser:
        superuser_in = UserCreate(
            email=settings.FIRST_SUPERUSER_EMAIL,
            password=settings.FIRST_SUPERUSER_PASSWORD,
            full_name="Superuser",
            is_superuser=True,
        )
        superuser = crud_user.create_user(db, user_in=superuser_in)
        logger.info("Created superuser")

        admin_role = crud_user.get_role_by_name(db, name="admin")
        if admin_role:
            crud_user.assign_role_to_user(
                db,
                user_role_in=UserRoleCreate(user_id=superuser.id, role_id=admin_role.id)
            )
            logger.info("Assigned admin role to superuser")
