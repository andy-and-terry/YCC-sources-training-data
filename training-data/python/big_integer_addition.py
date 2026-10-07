def add_strings(a, b):
    i, j, carry = len(a) - 1, len(b) - 1, 0
    out = []
    while i >= 0 or j >= 0 or carry:
        s = carry
        if i >= 0:
            s += ord(a[i]) - 48; i -= 1
        if j >= 0:
            s += ord(b[j]) - 48; j -= 1
        out.append(chr(s % 10 + 48))
        carry = s // 10
    return "".join(reversed(out)) or "0"


def multiply_strings(a, b):
    res = [0] * (len(a) + len(b))
    for i in range(len(a) - 1, -1, -1):
        for j in range(len(b) - 1, -1, -1):
            p = (ord(a[i]) - 48) * (ord(b[j]) - 48) + res[i + j + 1]
            res[i + j + 1] = p % 10
            res[i + j] += p // 10
    s = "".join(map(str, res)).lstrip("0")
    return s or "0"


if __name__ == "__main__":
    x, y = "99999999999999999999", "1"
    print(add_strings(x, y))
    print(multiply_strings("123456789", "987654321"), 123456789 * 987654321)
