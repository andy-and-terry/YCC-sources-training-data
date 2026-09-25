def hamming_str(a, b):
    if len(a) != len(b):
        raise ValueError("strings must have equal length")
    return sum(x != y for x, y in zip(a, b))


def hamming_int(x, y):
    return bin(x ^ y).count("1")


if __name__ == "__main__":
    print(hamming_str("karolin", "kathrin"))
    print(hamming_int(1, 4))
