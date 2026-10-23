from fractions import Fraction

a = Fraction(1, 3)
b = Fraction(2, 6)
print(a == b, a + b, a * b)

print(Fraction("3/4") + Fraction("0.25"))
print(Fraction(0.1))
print(Fraction(0.1).limit_denominator(100))

total = sum(Fraction(1, n) for n in range(1, 7))
print(total, float(total))
print(Fraction(7, 2).numerator, Fraction(7, 2).denominator)
print(round(Fraction(7, 2)), round(Fraction(5, 2)))
