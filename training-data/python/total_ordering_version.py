"""functools.total_ordering fills in comparison methods from __eq__ and one other."""
from functools import total_ordering


@total_ordering
class Version:
    def __init__(self, text: str):
        self.parts = tuple(int(p) for p in text.split("."))

    def __eq__(self, other):
        if not isinstance(other, Version):
            return NotImplemented
        return self.parts == other.parts

    def __lt__(self, other):
        if not isinstance(other, Version):
            return NotImplemented
        return self.parts < other.parts

    def __hash__(self):
        return hash(self.parts)

    def __repr__(self):
        return "Version(" + ".".join(map(str, self.parts)) + ")"


a, b = Version("1.2.10"), Version("1.10.0")
print(a < b, a <= b, a > b, a >= b, a == b)
print(sorted([b, a, Version("0.9")]))
print(max(a, b))
