"""Python 3.10+ structural pattern matching over classes, sequences, and guards."""

from dataclasses import dataclass
from typing import Union


@dataclass
class Circle:
    radius: float


@dataclass
class Rectangle:
    width: float
    height: float


@dataclass
class Triangle:
    base: float
    height: float


Shape = Union[Circle, Rectangle, Triangle]


def area(shape: Shape) -> float:
    match shape:
        case Circle(radius=r) if r > 0:
            return 3.14159 * r * r
        case Rectangle(width=w, height=h):
            return w * h
        case Triangle(base=b, height=h):
            return 0.5 * b * h
        case _:
            raise ValueError(f"unsupported shape: {shape}")


def describe_command(command: list) -> str:
    match command:
        case ["quit"]:
            return "exiting"
        case ["move", direction]:
            return f"moving {direction}"
        case ["move", direction, int(steps)]:
            return f"moving {direction} by {steps}"
        case [cmd, *rest]:
            return f"unknown command {cmd!r} with args {rest}"
        case []:
            return "no command"


if __name__ == "__main__":
    for shape in [Circle(2), Rectangle(3, 4), Triangle(6, 5)]:
        print(f"{shape}: area={area(shape):.2f}")

    for cmd in [["quit"], ["move", "north"], ["move", "east", 3], ["jump"], []]:
        print(describe_command(cmd))
