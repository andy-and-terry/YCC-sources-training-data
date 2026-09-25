DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz"


def to_base(n, base):
    if not 2 <= base <= 36:
        raise ValueError("base out of range")
    if n == 0:
        return "0"
    sign = "-" if n < 0 else ""
    n = abs(n)
    out = []
    while n:
        n, r = divmod(n, base)
        out.append(DIGITS[r])
    return sign + "".join(reversed(out))


def from_base(s, base):
    s = s.lower()
    sign = -1 if s.startswith("-") else 1
    value = 0
    for ch in s.lstrip("-"):
        value = value * base + DIGITS.index(ch)
    return sign * value


if __name__ == "__main__":
    for n, b in [(255, 2), (255, 16), (-1295, 36), (0, 7)]:
        s = to_base(n, b)
        assert from_base(s, b) == n
        print(n, "base", b, "=", s)
