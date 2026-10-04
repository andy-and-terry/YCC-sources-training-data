from typing import NotRequired, Required, TypedDict


class Address(TypedDict):
    street: str
    city: str


class User(TypedDict):
    name: Required[str]
    age: int
    email: NotRequired[str]
    address: Address


def describe(user: User) -> str:
    base = f"{user['name']} ({user['age']}) from {user['address']['city']}"
    if "email" in user:
        base += f" <{user['email']}>"
    return base


def validate(data: dict, schema: type) -> list:
    errors = []
    hints = schema.__annotations__
    for key in schema.__required_keys__:
        if key not in data:
            errors.append(f"missing key: {key}")
    for key in data:
        if key not in hints:
            errors.append(f"unexpected key: {key}")
    return errors


if __name__ == "__main__":
    u: User = {"name": "Ann", "age": 30, "address": {"street": "1 Main", "city": "Oslo"}}
    print(describe(u))
    u["email"] = "ann@example.com"
    print(describe(u))
    print(validate({"age": 3, "zip": 1}, User))
    print(sorted(User.__required_keys__), sorted(User.__optional_keys__))
