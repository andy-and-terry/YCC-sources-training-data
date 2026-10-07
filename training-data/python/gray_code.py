def gray_code(n):
    return [i ^ (i >> 1) for i in range(1 << n)]


def from_gray(g):
    n = 0
    while g:
        n ^= g
        g >>= 1
    return n


codes = gray_code(3)
print([format(c, "03b") for c in codes])
print(all(bin(a ^ b).count("1") == 1 for a, b in zip(codes, codes[1:])))
print([from_gray(c) for c in codes])
