import sys


class Plain:
    def __init__(self, x, y):
        self.x = x
        self.y = y


class Slotted:
    __slots__ = ("x", "y")

    def __init__(self, x, y):
        self.x = x
        self.y = y


if __name__ == "__main__":
    p, s = Plain(1, 2), Slotted(1, 2)
    print(hasattr(p, "__dict__"), hasattr(s, "__dict__"))
    print(sys.getsizeof(p.__dict__) > 0)
    try:
        s.z = 3
    except AttributeError as exc:
        print("slotted rejects new attrs:", exc)
