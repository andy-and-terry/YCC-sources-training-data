from dataclasses import dataclass

@dataclass(frozen=True, slots=True)
class Point:
    x: int
    y: int

p = Point(1, 2)
try:
    p.x = 5
except AttributeError as e:
    print("frozen:", type(e).__name__)
