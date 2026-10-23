def polygonal(s: int, n: int) -> int:
    """n-th s-gonal number: ((s - 2) * n^2 - (s - 4) * n) / 2."""
    return ((s - 2) * n * n - (s - 4) * n) // 2


if __name__ == "__main__":
    for name, s in (("triangular", 3), ("pentagonal", 5), ("hexagonal", 6)):
        print(name + ":", *(polygonal(s, n) for n in range(1, 11)))
