from dataclasses import dataclass, field, replace


@dataclass(frozen=True, slots=True, order=True)
class Point:
    x: int
    y: int = 0
    tags: tuple = field(default=(), compare=False)


p = Point(1, 2)
q = replace(p, y=5)
print(p, q, p < q)
try:
    p.x = 10
except Exception as e:
    print(type(e).__name__)
print(hash(p) == hash(Point(1, 2)))
