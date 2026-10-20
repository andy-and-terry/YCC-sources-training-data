from enum import IntFlag, StrEnum


class Color(StrEnum):
    RED = "red"
    GREEN = "green"


class Perm(IntFlag):
    READ = 4
    WRITE = 2
    EXEC = 1


if __name__ == "__main__":
    print(Color.RED == "red", f"paint it {Color.GREEN}", Color("red"))
    mode = Perm.READ | Perm.WRITE
    print(mode, int(mode), Perm.EXEC in mode, Perm.WRITE in mode)
    print(Perm(7), Perm(0))
