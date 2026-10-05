def gray_code(n: int) -> list[int]:
    return [i ^ (i >> 1) for i in range(1 << n)]


def gray_to_binary(g: int) -> int:
    n = 0
    while g:
        n ^= g
        g >>= 1
    return n


if __name__ == "__main__":
    width = 3
    codes = gray_code(width)
    for c in codes:
        print(format(c, f"0{width}b"), gray_to_binary(c))
    # adjacent codes differ in exactly one bit
    assert all(bin(a ^ b).count("1") == 1 for a, b in zip(codes, codes[1:]))
