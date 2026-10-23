from functools import total_ordering


# Define __eq__ and one ordering method; total_ordering fills in the rest.
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

    def __repr__(self):
        return "Version(" + ".".join(map(str, self.parts)) + ")"


a, b = Version("1.2.10"), Version("1.10.0")
print(a < b, a <= b, a > b, a >= b, a != b)
print(sorted([b, a, Version("1.2.9")]))
print(max(a, b))
