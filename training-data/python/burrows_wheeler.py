def bwt(s: str) -> str:
    rots = sorted(s[i:] + s[:i] for i in range(len(s)))
    return "".join(r[-1] for r in rots)


def inverse_bwt(last: str) -> str:
    table = [""] * len(last)
    for _ in last:
        table = sorted(c + row for c, row in zip(last, table))
    return next(r for r in table if r.endswith("$"))


enc = bwt("banana$")
print(enc, inverse_bwt(enc))
