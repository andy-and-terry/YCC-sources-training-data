from typing import Literal, NewType, assert_never

UserId = NewType("UserId", int)
Mode = Literal["r", "w", "a"]


def describe(mode: Mode) -> str:
    if mode == "r":
        return "read"
    elif mode == "w":
        return "write"
    elif mode == "a":
        return "append"
    else:
        assert_never(mode)  # type checker flags missing branches


def lookup(uid: UserId) -> str:
    return f"user-{uid}"


if __name__ == "__main__":
    print(describe("w"), lookup(UserId(5)))
    print(type(UserId(5)))  # NewType is erased at runtime: plain int
