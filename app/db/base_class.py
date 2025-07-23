from typing import Any
from sqlalchemy.orm import declared_attr
from sqlalchemy.ext.declarative import as_declarative

@as_declarative()
class Base:
    id: Any
    __name__: str

    @declared_attr  # type: ignore
    def __tablename__(cls) -> str:
        return cls.__name__.lower()
