"""Structural pattern matching beyond simple literals: class patterns
that destructure objects via __match_args__, sequence patterns with a
*rest capture, mapping patterns with **rest, and combined or-patterns
with guards."""

from dataclasses import dataclass
from typing import Any


@dataclass
class Point:
    x: int
    y: int


def describe_point(p: Point) -> str:
    match p:
        case Point(x=0, y=0):
            return "origin"
        case Point(x=0, y=y):
            return f"on the y-axis at {y}"
        case Point(x=x, y=0):
            return f"on the x-axis at {x}"
        case Point(x=x, y=y) if x == y:
            return f"on the diagonal at {x}"
        case Point():
            return "somewhere else"


def summarize_sequence(items: list) -> str:
    match items:
        case []:
            return "empty"
        case [single]:
            return f"single item: {single}"
        case [first, second]:
            return f"pair: {first}, {second}"
        case [first, *rest] if rest:
            return f"starts with {first}, {len(rest)} more"
        case _:
            return "unmatched"


def handle_event(event: dict) -> str:
    match event:
        case {"type": "click" | "tap", "x": x, "y": y}:
            return f"pointer event at ({x}, {y})"
        case {"type": "key", "code": ("enter" | "return")}:
            return "confirm key pressed"
        case {"type": str() as kind, **rest}:
            return f"generic '{kind}' event with extra fields {sorted(rest)}"
        case _:
            return "malformed event"


def type_name(value: Any) -> str:
    match value:
        case int() | float():
            return "number"
        case str() | bytes():
            return "text-like"
        case [*_]:
            return "sequence"
        case {}:
            return "mapping"
        case _:
            return "other"


if __name__ == "__main__":
    for point in [Point(0, 0), Point(0, 5), Point(5, 0), Point(3, 3), Point(1, 2)]:
        print(point, "->", describe_point(point))

    for seq in [[], [1], [1, 2], [1, 2, 3, 4]]:
        print(seq, "->", summarize_sequence(seq))

    events = [
        {"type": "click", "x": 10, "y": 20},
        {"type": "key", "code": "enter"},
        {"type": "resize", "width": 800, "height": 600},
        {"nope": True},
    ]
    for ev in events:
        print(ev, "->", handle_event(ev))

    for value in [42, "hi", [1, 2], {"a": 1}, 3.14]:
        print(value, "->", type_name(value))
