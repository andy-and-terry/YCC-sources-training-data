def moser_de_bruijn(count):
    """Numbers that are sums of distinct powers of 4."""
    out = []
    for i in range(count):
        value, power = 0, 1
        while i:
            if i & 1:
                value += power
            power *= 4
            i >>= 1
        out.append(value)
    return out


print(moser_de_bruijn(10))  # [0, 1, 4, 5, 16, 17, 20, 21, 64, 65]
