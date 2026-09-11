"""Demonstrates Python's enum module: Enum, IntEnum, auto(), and methods on enums."""

from enum import Enum, IntEnum, auto


class Suit(Enum):
    HEARTS = auto()
    DIAMONDS = auto()
    CLUBS = auto()
    SPADES = auto()

    @property
    def color(self) -> str:
        return "red" if self in (Suit.HEARTS, Suit.DIAMONDS) else "black"


class Priority(IntEnum):
    LOW = 1
    MEDIUM = 2
    HIGH = 3

    def is_urgent(self) -> bool:
        return self >= Priority.HIGH


if __name__ == "__main__":
    for suit in Suit:
        print(f"{suit.name}: {suit.color}")

    print(Priority.HIGH > Priority.LOW)
    print(Priority.MEDIUM.is_urgent())
    print([p.name for p in sorted(Priority, reverse=True)])
