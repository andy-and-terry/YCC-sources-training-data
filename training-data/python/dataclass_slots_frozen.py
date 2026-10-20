from dataclasses import dataclass, replace


@dataclass(frozen=True, slots=True)
class Point:
    x: float
    y: float


if __name__ == "__main__":
    p = Point(1, 2)
    print(replace(p, y=5))
