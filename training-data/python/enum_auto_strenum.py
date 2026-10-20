from enum import StrEnum, auto


class Color(StrEnum):
    RED = auto()
    GREEN = auto()


if __name__ == "__main__":
    print(Color.RED, Color("green") is Color.GREEN)
