from typing import Optional, List
from datetime import datetime
from pydantic import BaseModel, EmailStr

# Shared properties
class UserBase(BaseModel):
    email: Optional[EmailStr] = None
    is_active: Optional[bool] = True
    is_superuser: bool = False
    full_name: Optional[str] = None

# Properties to receive via API on creation
class UserCreate(UserBase):
    email: EmailStr
    password: str

# Properties to receive via API on update
class UserUpdate(UserBase):
    password: Optional[str] = None

# Properties shared by models stored in DB
class UserInDBBase(UserBase):
    id: int
    email: EmailStr
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True  

    # class Config:
    #     from_attributes = True


# Additional properties to return via API
class User(UserInDBBase):
    pass

# Additional properties stored in DB
class UserInDB(UserInDBBase):
    hashed_password: str

# Role schemas
class RoleBase(BaseModel):
    name: str
    description: Optional[str] = None

class RoleCreate(RoleBase):
    pass

class RoleUpdate(RoleBase):
    pass

class RoleInDBBase(RoleBase):
    id: int
    created_at: datetime
    updated_at: datetime

    # class Config:
    #     orm_mode = True  

    class Config:
        from_attributes = True

class Role(RoleInDBBase):
    pass

# User-Role relationship schemas
class UserRoleBase(BaseModel):
    user_id: int
    role_id: int

class UserRoleCreate(UserRoleBase):
    pass

class UserRoleInDBBase(UserRoleBase):
    id: int
    created_at: datetime

    # class Config:
    #     orm_mode = True 
    class Config:
        from_attributes = True


class UserRole(UserRoleInDBBase):
    pass

# Response models
class UserWithRoles(User):
    roles: List[Role] = [] 