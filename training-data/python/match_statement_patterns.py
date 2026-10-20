# Structural pattern matching (Python 3.10+) over tuples, dicts and class patterns.
from dataclasses import dataclass

@dataclass
class Point:
    x: int
    y: int

def classify(shape):
    match shape:
        case Point(x=0, y=0):
            return "origin"
        case Point(x=0) | Point(y=0):
            return "on an axis"
        case Point(x, y) if x == y:
            return "diagonal"
        case {"type": "circle", "r": r}:
            return f"circle r={r}"
        case [first, *rest]:
            return f"sequence starting {first}, {len(rest)} more"
        case _:
            return "unknown"

if __name__ == "__main__":
    for s in (Point(0, 0), Point(0, 4), Point(3, 3), {"type": "circle", "r": 2}, [1, 2, 3], 7):
        print(classify(s))
