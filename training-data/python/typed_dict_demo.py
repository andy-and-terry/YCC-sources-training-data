from typing import NotRequired, TypedDict


class Address(TypedDict):
    city: str
    zip_code: str


class User(TypedDict):
    name: str
    age: int
    address: Address
    nickname: NotRequired[str]


def describe(user: User) -> str:
    nick = user.get("nickname", user["name"])
    return f"{nick} ({user['age']}) from {user['address']['city']}"


if __name__ == "__main__":
    u: User = {"name": "Ada", "age": 36,
               "address": {"city": "London", "zip_code": "N1"}}
    print(describe(u))
    u["nickname"] = "Countess"
    print(describe(u))
    print(User.__required_keys__, User.__optional_keys__)
