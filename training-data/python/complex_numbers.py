import math


class Complex:
    def __init__(self, re, im=0.0):
        self.re, self.im = re, im

    def __add__(self, o):
        return Complex(self.re + o.re, self.im + o.im)

    def __mul__(self, o):
        return Complex(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re)

    def conj(self):
        return Complex(self.re, -self.im)

    def abs(self):
        return math.hypot(self.re, self.im)

    def __truediv__(self, o):
        d = o.re ** 2 + o.im ** 2
        num = self * o.conj()
        return Complex(num.re / d, num.im / d)

    @staticmethod
    def polar(r, theta):
        return Complex(r * math.cos(theta), r * math.sin(theta))

    def __repr__(self):
        sign = "+" if self.im >= 0 else "-"
        return f"({self.re:.3f} {sign} {abs(self.im):.3f}i)"


if __name__ == "__main__":
    a, b = Complex(3, 4), Complex(1, -2)
    print(a + b, a * b, a / b, a.abs())
    print("e^(i*pi) =", Complex.polar(1, math.pi))
