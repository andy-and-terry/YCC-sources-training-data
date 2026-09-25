def gray_code(n):
    return [i ^ (i >> 1) for i in range(1 << n)]


def gray_to_binary(g):
    b = 0
    while g:
        b ^= g
        g >>= 1
    return b


if __name__ == "__main__":
    codes = gray_code(4)
    for c in codes:
        print(f"{c:04b}", gray_to_binary(c))
    assert all(bin(a ^ b).count("1") == 1 for a, b in zip(codes, codes[1:]))
