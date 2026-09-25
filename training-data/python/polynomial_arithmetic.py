class Poly:
    def __init__(self, coeffs):
        """coeffs[i] is the coefficient of x^i."""
        c = list(coeffs)
        while len(c) > 1 and c[-1] == 0:
            c.pop()
        self.c = c or [0]

    def __add__(self, o):
        n = max(len(self.c), len(o.c))
        return Poly([(self.c[i] if i < len(self.c) else 0) + (o.c[i] if i < len(o.c) else 0) for i in range(n)])

    def __mul__(self, o):
        out = [0] * (len(self.c) + len(o.c) - 1)
        for i, a in enumerate(self.c):
            for j, b in enumerate(o.c):
                out[i + j] += a * b
        return Poly(out)

    def __call__(self, x):
        acc = 0
        for coef in reversed(self.c):
            acc = acc * x + coef
        return acc

    def derivative(self):
        return Poly([i * c for i, c in enumerate(self.c)][1:] or [0])

    def __repr__(self):
        terms = []
        for i in range(len(self.c) - 1, -1, -1):
            c = self.c[i]
            if c == 0:
                continue
            t = f"{c}" if i == 0 else f"{'' if c == 1 else c}x" + (f"^{i}" if i > 1 else "")
            terms.append(t)
        return " + ".join(terms) or "0"


if __name__ == "__main__":
    p, q = Poly([1, 1]), Poly([-1, 1])
    print(p * q, "|", (p * p * p), "|", (p * p * p).derivative())
    print(Poly([1, 2, 3])(2))
