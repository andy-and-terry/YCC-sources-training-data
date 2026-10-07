"""TypedDict for dict-shaped records, including optional keys with
NotRequired and a runtime check helper."""

from typing import NotRequired, TypedDict


class User(TypedDict):
    id: int
    name: str
    email: NotRequired[str]


def describe(user: User) -> str:
    email = user.get("email", "<no email>")
    return f"#{user['id']} {user['name']} {email}"


def has_required_keys(data: dict) -> bool:
    return all(k in data for k in User.__required_keys__)


if __name__ == "__main__":
    u1: User = {"id": 1, "name": "Ada"}
    u2: User = {"id": 2, "name": "Linus", "email": "l@example.com"}
    print(describe(u1))
    print(describe(u2))
    print(sorted(User.__required_keys__), sorted(User.__optional_keys__))
    print(has_required_keys({"id": 3}))
