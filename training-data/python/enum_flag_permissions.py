from enum import Flag, auto


class Perm(Flag):
    READ = auto()
    WRITE = auto()
    EXEC = auto()


if __name__ == "__main__":
    p = Perm.READ | Perm.WRITE
    print(p, Perm.EXEC in p, Perm.WRITE in p)
