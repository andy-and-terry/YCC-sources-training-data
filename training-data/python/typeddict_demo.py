from typing import TypedDict, NotRequired


class Address(TypedDict):
    street: str
    zip: str


class User(TypedDict):
    name: str
    age: int
    address: Address
    nickname: NotRequired[str]


def describe(u: User) -> str:
    nick = u.get("nickname", u["name"])
    return f"{nick} ({u['age']}) lives at {u['address']['street']}"


user: User = {"name": "Ada", "age": 36, "address": {"street": "1 Main", "zip": "12345"}}
print(describe(user))
print(User.__required_keys__, User.__optional_keys__)
