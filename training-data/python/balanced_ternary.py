"""Convert integers to/from balanced ternary using digits '-', '0', '+'."""


def to_bt(n):
    if n == 0:
        return "0"
    out = []
    while n:
        r = n % 3
        if r == 0:
            out.append("0")
        elif r == 1:
            out.append("+")
            n -= 1
        else:
            out.append("-")
            n += 1
        n //= 3
    return "".join(reversed(out))


def from_bt(s):
    val = {"-": -1, "0": 0, "+": 1}
    n = 0
    for ch in s:
        n = n * 3 + val[ch]
    return n


if __name__ == "__main__":
    for k in (-14, -1, 0, 5, 42):
        assert from_bt(to_bt(k)) == k
        print(k, to_bt(k))
