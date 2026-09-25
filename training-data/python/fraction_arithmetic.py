from math import gcd


class Frac:
    __slots__ = ("n", "d")

    def __init__(self, n, d=1):
        if d == 0:
            raise ZeroDivisionError("zero denominator")
        if d < 0:
            n, d = -n, -d
        g = gcd(n, d) or 1
        self.n, self.d = n // g, d // g

    def __add__(self, o):
        return Frac(self.n * o.d + o.n * self.d, self.d * o.d)

    def __sub__(self, o):
        return Frac(self.n * o.d - o.n * self.d, self.d * o.d)

    def __mul__(self, o):
        return Frac(self.n * o.n, self.d * o.d)

    def __truediv__(self, o):
        return Frac(self.n * o.d, self.d * o.n)

    def __eq__(self, o):
        return (self.n, self.d) == (o.n, o.d)

    def __repr__(self):
        return f"{self.n}/{self.d}" if self.d != 1 else str(self.n)


if __name__ == "__main__":
    a, b = Frac(1, 3), Frac(1, 6)
    print(a + b, a - b, a * b, a / b)
    total = Frac(0)
    for k in range(1, 11):
        total = total + Frac(1, k * (k + 1))
    print("telescoping sum:", total)
