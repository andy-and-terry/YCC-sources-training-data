from dataclasses import dataclass, asdict, fields
from typing import Any, Dict, Type, TypeVar

T = TypeVar("T")


@dataclass
class User:
    id: int
    name: str
    email: str


def to_row(entity) -> Dict[str, Any]:
    return asdict(entity)


def from_row(cls: Type[T], row: Dict[str, Any]) -> T:
    field_names = {f.name for f in fields(cls)}
    return cls(**{k: v for k, v in row.items() if k in field_names})


class InMemoryTable:
    def __init__(self, model: Type[T]):
        self.model = model
        self.rows: Dict[int, T] = {}

    def insert(self, entity):
        self.rows[entity.id] = entity

    def get(self, id_: int):
        return self.rows.get(id_)

    def query(self, **filters):
        return [
            row for row in self.rows.values()
            if all(getattr(row, k) == v for k, v in filters.items())
        ]


if __name__ == "__main__":
    table = InMemoryTable(User)
    table.insert(User(1, "Alice", "alice@example.com"))
    table.insert(User(2, "Bob", "bob@example.com"))
    print(table.query(name="Alice"))
