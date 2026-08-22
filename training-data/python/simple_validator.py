import re
from typing import Any, Callable, Dict, List


class ValidationError(Exception):
    def __init__(self, errors: Dict[str, List[str]]):
        super().__init__(str(errors))
        self.errors = errors


def required(value: Any) -> bool:
    return value is not None and value != ""


def is_email(value: str) -> bool:
    return bool(re.match(r"^[^@\s]+@[^@\s]+\.[^@\s]+$", value or ""))


def min_length(n: int) -> Callable[[str], bool]:
    return lambda value: len(value or "") >= n


def validate(data: dict, schema: Dict[str, List[Callable]]) -> None:
    errors: Dict[str, List[str]] = {}
    for field, rules in schema.items():
        for rule in rules:
            if not rule(data.get(field)):
                errors.setdefault(field, []).append(rule.__name__ or "invalid")
    if errors:
        raise ValidationError(errors)


if __name__ == "__main__":
    schema = {"email": [required, is_email], "password": [required, min_length(8)]}
    try:
        validate({"email": "not-an-email", "password": "short"}, schema)
    except ValidationError as e:
        print(e.errors)
