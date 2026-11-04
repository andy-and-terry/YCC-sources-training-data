DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz"


def to_base(n, base):
    if n == 0:
        return "0"
    sign, n = ("-", -n) if n < 0 else ("", n)
    out = []
    while n:
        n, r = divmod(n, base)
        out.append(DIGITS[r])
    return sign + "".join(reversed(out))


def from_base(s, base):
    return int(s, base)


print(to_base(255, 2), to_base(255, 16), to_base(-1295, 36))
print(from_base("zz", 36))
