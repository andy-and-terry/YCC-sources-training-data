# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
import std/math

proc powMod(b, e, m: int): int =
  var (base, exp, r) = (b mod m, e, 1)
  while exp > 0:
    if (exp and 1) == 1: r = r * base mod m
    base = base * base mod m
    exp = exp shr 1
  r

proc isPrime(n: int): bool =
  var p = 2
  while p * p <= n:
    if n mod p == 0: return false
    inc p
  n > 1

proc isCarmichael(n: int): bool =
  if isPrime(n): return false
  for a in 2 ..< n:
    if gcd(a, n) == 1 and powMod(a, n - 1, n) != 1: return false
  true

for n in countup(3, 2999, 2):
  if isCarmichael(n): stdout.write n, " "
echo ""
