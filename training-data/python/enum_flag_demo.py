"""enum.Enum / IntEnum / Flag: named constants with type safety, plus
bitwise-combinable flags via auto()."""

from enum import Enum, Flag, IntEnum, auto


class Direction(Enum):
    NORTH = auto()
    SOUTH = auto()
    EAST = auto()
    WEST = auto()


class Priority(IntEnum):
    LOW = 1
    MEDIUM = 2
    HIGH = 3


class Permission(Flag):
    NONE = 0
    READ = auto()
    WRITE = auto()
    EXECUTE = auto()
    ALL = READ | WRITE | EXECUTE


if __name__ == "__main__":
    d = Direction.NORTH
    print(d, d.name, d.value)
    print(d is Direction.NORTH)

    # IntEnum members compare and sort like plain ints.
    tasks = sorted([Priority.HIGH, Priority.LOW, Priority.MEDIUM])
    print([p.name for p in tasks])
    print(Priority.HIGH > 2)

    perms = Permission.READ | Permission.WRITE
    print(perms)
    print(Permission.READ in perms)
    print(Permission.EXECUTE in perms)
    print(perms & Permission.ALL)
