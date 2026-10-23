import math

type Frac = object
  num, den: int

proc frac(n, d: int): Frac =
  let g = gcd(n, d)
  let s = if d < 0: -1 else: 1
  Frac(num: s * n div g, den: s * d div g)

proc `+`(a, b: Frac): Frac = frac(a.num * b.den + b.num * a.den, a.den * b.den)
proc `*`(a, b: Frac): Frac = frac(a.num * b.num, a.den * b.den)
proc `$`(a: Frac): string = $a.num & "/" & $a.den

echo frac(1, 2) + frac(1, 3)
echo frac(2, 4) * frac(3, -9)
