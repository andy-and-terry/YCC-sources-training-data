"""enum.Flag and IntFlag model combinable permission bits."""
from enum import Flag, IntFlag, auto


class Perm(Flag):
    NONE = 0
    READ = auto()
    WRITE = auto()
    EXEC = auto()
    ALL = READ | WRITE | EXEC


class Mode(IntFlag):
    R = 4
    W = 2
    X = 1


user = Perm.READ | Perm.WRITE
print(user)
print(Perm.READ in user, Perm.EXEC in user)
print(user & ~Perm.WRITE)
print(Perm.ALL == (user | Perm.EXEC))

mode = Mode.R | Mode.W
print(int(mode), mode == 6, mode | Mode.X)
print([m.name for m in Mode if m in mode])
