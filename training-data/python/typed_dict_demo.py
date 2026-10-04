"""TypedDict, NamedTuple and Literal for lightweight typed records."""
from typing import Literal, NamedTuple, NotRequired, TypedDict


class Movie(TypedDict):
    title: str
    year: int
    rating: NotRequired[float]


class Point(NamedTuple):
    x: int
    y: int = 0

    def dist2(self) -> int:
        return self.x ** 2 + self.y ** 2


Mode = Literal["r", "w"]


def open_mode(mode: Mode) -> str:
    return "reading" if mode == "r" else "writing"


def main():
    m: Movie = {"title": "Heat", "year": 1995}
    m["rating"] = 8.3
    print(m, m.get("rating"))
    p = Point(3, 4)
    print(p, p.dist2(), p._replace(x=0))
    print(open_mode("r"), open_mode("w"))
    print(Movie.__required_keys__, Movie.__optional_keys__)


if __name__ == "__main__":
    main()
