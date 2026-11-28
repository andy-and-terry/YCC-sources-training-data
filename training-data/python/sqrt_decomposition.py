from math import isqrt


class SqrtSum:
    def __init__(self, a: list[int], bs: int | None = None):
        self.a = a
        self.bs = bs or max(1, isqrt(len(a)))
        self.blk = [sum(a[i:i + self.bs]) for i in range(0, len(a), self.bs)]

    def query(self, l: int, r: int) -> int:
        s, i = 0, l
        while i <= r:
            if i % self.bs == 0 and i + self.bs - 1 <= r:
                s += self.blk[i // self.bs]
                i += self.bs
            else:
                s += self.a[i]
                i += 1
        return s


print(SqrtSum([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4).query(2, 9))
