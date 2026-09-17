"""functools.singledispatch: dispatch a function by the type of its
first argument, without writing an isinstance chain."""

from functools import singledispatch
from typing import Union


@singledispatch
def describe(value) -> str:
    return f"unsupported type: {type(value).__name__}"


@describe.register
def _(value: int) -> str:
    return f"integer: {value}"


@describe.register
def _(value: float) -> str:
    return f"float: {value:.2f}"


@describe.register(list)
def _(value) -> str:
    return f"list of {len(value)} items"


@describe.register
def _(value: str) -> str:
    return f"string of length {len(value)}"


def describe_all(values: list) -> list:
    return [describe(v) for v in values]


if __name__ == "__main__":
    items: list[Union[int, float, str, list]] = [42, 3.14159, "hello", [1, 2, 3], object()]
    for line in describe_all(items):
        print(line)
