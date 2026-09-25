def hamming(a: str, b: str) -> int:
    if len(a) != len(b):
        raise ValueError("strands must be of equal length")
    return sum(x != y for x, y in zip(a, b))


if __name__ == "__main__":
    print(hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))
