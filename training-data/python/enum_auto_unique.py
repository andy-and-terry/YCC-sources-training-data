from enum import Enum, IntEnum, auto, unique


@unique
class Color(Enum):
    RED = auto()
    GREEN = auto()
    BLUE = auto()

    @property
    def hex(self):
        return {Color.RED: "#ff0000", Color.GREEN: "#00ff00", Color.BLUE: "#0000ff"}[self]


class Priority(IntEnum):
    LOW = 1
    MEDIUM = 5
    HIGH = 10


class Planet(Enum):
    EARTH = (5.97e24, 6.37e6)
    MARS = (6.42e23, 3.39e6)

    def __init__(self, mass, radius):
        self.mass = mass
        self.radius = radius

    def surface_gravity(self):
        return 6.674e-11 * self.mass / (self.radius ** 2)


if __name__ == "__main__":
    print([c.name for c in Color], Color.GREEN.value, Color.BLUE.hex)
    print(Priority.HIGH > Priority.LOW, sorted(Priority, reverse=True))
    print(Color["RED"], Color(2))
    for p in Planet:
        print(p.name, round(p.surface_gravity(), 2))
    try:
        @unique
        class Dup(Enum):
            A = 1
            B = 1
    except ValueError as e:
        print("error:", e)
