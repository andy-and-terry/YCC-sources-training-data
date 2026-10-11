import math

print(math.sqrt(16), math.isqrt(17), math.cbrt(27))
print(math.gcd(12, 18), math.lcm(4, 6), math.factorial(6))
print(math.comb(5, 2), math.perm(5, 2))
print(round(math.log(math.e), 3), math.log2(8), math.log10(1000), math.log(8, 2))
print(round(math.sin(math.pi / 2), 3), round(math.degrees(math.pi), 1))
print(math.hypot(3, 4), math.dist((0, 0), (3, 4)))
print(math.inf > 10**100, math.isnan(math.nan), math.nan == math.nan)
print(math.fsum([0.1] * 10), sum([0.1] * 10))
print(math.prod([1, 2, 3, 4]), math.copysign(3, -0.0))
print(math.modf(3.75), math.frexp(8))
