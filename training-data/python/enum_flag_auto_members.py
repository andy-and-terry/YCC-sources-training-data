from enum import Enum, Flag, IntEnum, auto


class Perm(Flag):
    R = auto()
    W = auto()
    X = auto()


class Level(IntEnum):
    LOW = 1
    HIGH = 2


p = Perm.R | Perm.X
print(p, Perm.W in p, Level.HIGH > Level.LOW)
print([m.name for m in Perm])
