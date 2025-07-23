from typing import List, Optional, Dict, Any
from sqlalchemy.orm import Session
from app.models.user import User, Role, UserRole
from app.schemas.user import UserCreate, UserUpdate, RoleCreate, UserRoleCreate
from app.core.security import get_password_hash, verify_password
from app.core.exceptions import ResourceNotFoundError, ValidationError

def get_user(db: Session, user_id: int) -> Optional[User]:
    return db.query(User).filter(User.id == user_id).first()

def get_user_by_email(db: Session, email: str) -> Optional[User]:
    return db.query(User).filter(User.email == email).first()

def get_users(
    db: Session, 
    skip: int = 0, 
    limit: int = 100,
    filters: Optional[Dict[str, Any]] = None
) -> List[User]:
    query = db.query(User)
    if filters:
        for key, value in filters.items():
            if hasattr(User, key):
                query = query.filter(getattr(User, key) == value)
    return query.offset(skip).limit(limit).all()

def create_user(db: Session, user_in: UserCreate) -> User:
    # Check if user with email already exists
    if get_user_by_email(db, email=user_in.email):
        raise ValidationError(f"User with email {user_in.email} already exists")
    
    db_user = User(
        email=user_in.email,
        hashed_password=get_password_hash(user_in.password),
        full_name=user_in.full_name,
        is_active=user_in.is_active,
        is_superuser=user_in.is_superuser,
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def update_user(
    db: Session,
    db_user: User,
    user_in: UserUpdate
) -> User:
    update_data = user_in.model_dump(exclude_unset=True)
    if "password" in update_data:
        update_data["hashed_password"] = get_password_hash(update_data.pop("password"))
    
    for field, value in update_data.items():
        setattr(db_user, field, value)
    
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def delete_user(db: Session, user_id: int) -> None:
    user = get_user(db, user_id)
    if not user:
        raise ResourceNotFoundError(f"User with id {user_id} not found")
    db.delete(user)
    db.commit()

# Role CRUD operations
def get_role(db: Session, role_id: int) -> Optional[Role]:
    return db.query(Role).filter(Role.id == role_id).first()

def get_role_by_name(db: Session, name: str) -> Optional[Role]:
    return db.query(Role).filter(Role.name == name).first()

def get_roles(
    db: Session,
    skip: int = 0,
    limit: int = 100
) -> List[Role]:
    return db.query(Role).offset(skip).limit(limit).all()

def create_role(db: Session, role_in: RoleCreate) -> Role:
    # Check if role with name already exists
    if get_role_by_name(db, name=role_in.name):
        raise ValidationError(f"Role with name {role_in.name} already exists")
    
    db_role = Role(**role_in.model_dump())
    db.add(db_role)
    db.commit()
    db.refresh(db_role)
    return db_role

def update_role(
    db: Session,
    db_role: Role,
    role_in: RoleCreate
) -> Role:
    update_data = role_in.model_dump(exclude_unset=True)
    for field, value in update_data.items():
        setattr(db_role, field, value)
    
    db.add(db_role)
    db.commit()
    db.refresh(db_role)
    return db_role

def delete_role(db: Session, role_id: int) -> None:
    role = get_role(db, role_id)
    if not role:
        raise ResourceNotFoundError(f"Role with id {role_id} not found")
    db.delete(role)
    db.commit()

# User-Role relationship operations
def assign_role_to_user(
    db: Session,
    user_role_in: UserRoleCreate
) -> UserRole:
    # Check if user exists
    user = get_user(db, user_role_in.user_id)
    if not user:
        raise ResourceNotFoundError(f"User with id {user_role_in.user_id} not found")
    
    # Check if role exists
    role = get_role(db, user_role_in.role_id)
    if not role:
        raise ResourceNotFoundError(f"Role with id {user_role_in.role_id} not found")
    
    # Check if relationship already exists
    existing = db.query(UserRole).filter(
        UserRole.user_id == user_role_in.user_id,
        UserRole.role_id == user_role_in.role_id
    ).first()
    if existing:
        raise ValidationError("User already has this role")
    
    db_user_role = UserRole(**user_role_in.model_dump())
    db.add(db_user_role)
    db.commit()
    db.refresh(db_user_role)
    return db_user_role

def remove_role_from_user(
    db: Session,
    user_id: int,
    role_id: int
) -> None:
    user_role = db.query(UserRole).filter(
        UserRole.user_id == user_id,
        UserRole.role_id == role_id
    ).first()
    if not user_role:
        raise ResourceNotFoundError("User-Role relationship not found")
    
    db.delete(user_role)
    db.commit()

def get_user_roles(db: Session, user_id: int) -> List[Role]:
    user = get_user(db, user_id)
    if not user:
        raise ResourceNotFoundError(f"User with id {user_id} not found")
    
    return [ur.role for ur in user.roles] 