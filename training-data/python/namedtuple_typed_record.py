from typing import NamedTuple


class Edge(NamedTuple):
    src: str
    dst: str
    weight: float = 1.0


if __name__ == "__main__":
    e = Edge("a", "b", 2.5)
    src, dst, w = e
    print(e._replace(weight=9), src, dst, w)
