from typing import List, Optional
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from app.api import deps
from app.crud import user as crud_user
from app.schemas.user import (
    User,
    UserCreate,
    UserUpdate,
    Role,
    RoleCreate,
    UserRole,
    UserRoleCreate,
    UserWithRoles
)

router = APIRouter()

@router.get("/", response_model=List[User])
def read_users(
    db: Session = Depends(deps.get_db),
    skip: int = 0,
    limit: int = 100,
    email: Optional[str] = None,
    is_active: Optional[bool] = None
):
    """
    Retrieve users with optional filtering.
    """
    filters = {}
    if email:
        filters["email"] = email
    if is_active is not None:
        filters["is_active"] = is_active
    
    users = crud_user.get_users(db, skip=skip, limit=limit, filters=filters)
    return users

@router.post("/", response_model=User)
def create_user(
    *,
    db: Session = Depends(deps.get_db),
    user_in: UserCreate
):
    """
    Create new user.
    """
    user = crud_user.create_user(db, user_in=user_in)
    return user

@router.get("/{user_id}", response_model=UserWithRoles)
def read_user(
    *,
    db: Session = Depends(deps.get_db),
    user_id: int
):
    """
    Get user by ID.
    """
    user = crud_user.get_user(db, user_id=user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user

@router.put("/{user_id}", response_model=User)
def update_user(
    *,
    db: Session = Depends(deps.get_db),
    user_id: int,
    user_in: UserUpdate
):
    """
    Update user.
    """
    user = crud_user.get_user(db, user_id=user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    user = crud_user.update_user(db, db_user=user, user_in=user_in)
    return user

@router.delete("/{user_id}")
def delete_user(
    *,
    db: Session = Depends(deps.get_db),
    user_id: int
):
    """
    Delete user.
    """
    try:
        crud_user.delete_user(db, user_id=user_id)
        return {"status": "success"}
    except Exception as e:
        raise HTTPException(status_code=404, detail=str(e))

# Role endpoints
@router.get("/roles/", response_model=List[Role])
def read_roles(
    db: Session = Depends(deps.get_db),
    skip: int = 0,
    limit: int = 100
):
    """
    Retrieve roles.
    """
    roles = crud_user.get_roles(db, skip=skip, limit=limit)
    return roles

@router.post("/roles/", response_model=Role)
def create_role(
    *,
    db: Session = Depends(deps.get_db),
    role_in: RoleCreate
):
    """
    Create new role.
    """
    role = crud_user.create_role(db, role_in=role_in)
    return role

@router.get("/roles/{role_id}", response_model=Role)
def read_role(
    *,
    db: Session = Depends(deps.get_db),
    role_id: int
):
    """
    Get role by ID.
    """
    role = crud_user.get_role(db, role_id=role_id)
    if not role:
        raise HTTPException(status_code=404, detail="Role not found")
    return role

@router.put("/roles/{role_id}", response_model=Role)
def update_role(
    *,
    db: Session = Depends(deps.get_db),
    role_id: int,
    role_in: RoleCreate
):
    """
    Update role.
    """
    role = crud_user.get_role(db, role_id=role_id)
    if not role:
        raise HTTPException(status_code=404, detail="Role not found")
    role = crud_user.update_role(db, db_role=role, role_in=role_in)
    return role

@router.delete("/roles/{role_id}")
def delete_role(
    *,
    db: Session = Depends(deps.get_db),
    role_id: int
):
    """
    Delete role.
    """
    try:
        crud_user.delete_role(db, role_id=role_id)
        return {"status": "success"}
    except Exception as e:
        raise HTTPException(status_code=404, detail=str(e))

# User-Role relationship endpoints
@router.post("/{user_id}/roles/", response_model=UserRole)
def assign_role(
    *,
    db: Session = Depends(deps.get_db),
    user_id: int,
    role_id: int
):
    """
    Assign role to user.
    """
    user_role_in = UserRoleCreate(user_id=user_id, role_id=role_id)
    try:
        user_role = crud_user.assign_role_to_user(db, user_role_in=user_role_in)
        return user_role
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.delete("/{user_id}/roles/{role_id}")
def remove_role(
    *,
    db: Session = Depends(deps.get_db),
    user_id: int,
    role_id: int
):
    """
    Remove role from user.
    """
    try:
        crud_user.remove_role_from_user(db, user_id=user_id, role_id=role_id)
        return {"status": "success"}
    except Exception as e:
        raise HTTPException(status_code=404, detail=str(e))

@router.get("/{user_id}/roles/", response_model=List[Role])
def read_user_roles(
    *,
    db: Session = Depends(deps.get_db),
    user_id: int
):
    """
    Get user's roles.
    """
    try:
        roles = crud_user.get_user_roles(db, user_id=user_id)
        return roles
    except Exception as e:
        raise HTTPException(status_code=404, detail=str(e)) 