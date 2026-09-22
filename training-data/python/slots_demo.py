"""__slots__: tell Python to store an instance's attributes in a fixed
array instead of a per-instance __dict__, trading attribute
flexibility for lower memory use and slightly faster attribute access."""

import sys


class PointDict:
    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y


class PointSlots:
    __slots__ = ("x", "y")

    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y


class Point3D(PointSlots):
    """A subclass must declare its own __slots__ too, or it silently
    regains a __dict__ (and loses the memory savings)."""

    __slots__ = ("z",)

    def __init__(self, x: float, y: float, z: float):
        super().__init__(x, y)
        self.z = z


if __name__ == "__main__":
    regular = PointDict(1, 2)
    slotted = PointSlots(1, 2)

    print("regular has __dict__:", hasattr(regular, "__dict__"))
    print("slotted has __dict__:", hasattr(slotted, "__dict__"))
    print("regular size:", sys.getsizeof(regular) + sys.getsizeof(regular.__dict__))
    print("slotted size:", sys.getsizeof(slotted))

    regular.z = 3  # fine: __dict__ accepts arbitrary new attributes
    try:
        slotted.z = 3
    except AttributeError as e:
        print("slotted rejects new attribute:", e)

    p3 = Point3D(1, 2, 3)
    print(p3.x, p3.y, p3.z)
