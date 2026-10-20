from typing import Literal, overload


@overload
def parse(x: str, as_int: Literal[True]) -> int: ...
@overload
def parse(x: str, as_int: Literal[False]) -> str: ...
def parse(x, as_int):
    return int(x) if as_int else x


if __name__ == "__main__":
    print(parse("42", True) + 1)
