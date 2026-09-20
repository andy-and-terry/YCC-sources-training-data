"""__slots__ tells Python not to give instances a per-object __dict__,
trading away dynamic attribute assignment for lower memory use and
faster attribute access -- useful for classes with many instances."""

import sys


class PointDict:
    def __init__(self, x, y):
        self.x = x
        self.y = y


class PointSlots:
    __slots__ = ("x", "y")

    def __init__(self, x, y):
        self.x = x
        self.y = y


if __name__ == "__main__":
    p1 = PointDict(1, 2)
    p2 = PointSlots(1, 2)

    print("PointDict instance size:", sys.getsizeof(p1) + sys.getsizeof(p1.__dict__))
    print("PointSlots instance size:", sys.getsizeof(p2))

    p1.color = "red"  # fine: PointDict has a __dict__
    print("PointDict allows new attributes:", p1.color)

    try:
        p2.color = "red"
    except AttributeError as e:
        print("PointSlots rejects new attributes:", e)
