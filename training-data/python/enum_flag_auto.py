from enum import Enum, Flag, auto


class Color(Enum):
    RED = auto()
    GREEN = auto()


class Perm(Flag):
    R = auto()
    W = auto()
    X = auto()


p = Perm.R | Perm.W
print(Color.GREEN.value, p, Perm.W in p, Perm.X in p)
