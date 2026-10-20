from functools import total_ordering


@total_ordering
class Version:
    """Define __eq__ and __lt__ only; total_ordering fills in the rest."""

    def __init__(self, text):
        self.parts = tuple(int(p) for p in text.split("."))

    def __eq__(self, other):
        return self.parts == other.parts

    def __lt__(self, other):
        return self.parts < other.parts

    def __repr__(self):
        return "Version(" + ".".join(map(str, self.parts)) + ")"


if __name__ == "__main__":
    a, b = Version("1.2.10"), Version("1.10.0")
    print(a < b, a <= b, a > b, a >= b)
    print(sorted([b, a, Version("0.9")]))
