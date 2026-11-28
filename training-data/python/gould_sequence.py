def gould(n: int) -> int:
    """Odd entries in row n of Pascal's triangle: 2**popcount(n)."""
    return 2 ** bin(n).count("1")


if __name__ == "__main__":
    print([gould(n) for n in range(16)])
