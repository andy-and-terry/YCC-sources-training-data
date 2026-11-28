import math

proc rho(n: int): int =
  if n mod 2 == 0: return 2
  proc f(v: int): int = (v * v + 1) mod n
  var x, y, d = 2
  d = 1
  while d == 1:
    x = f(x)
    y = f(f(y))
    d = gcd(abs(x - y), n)
  d

let n = 8051
let p = rho(n)
echo n, " = ", p, " * ", n div p
