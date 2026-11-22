# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
import strutils

proc fact(n: int): int =
  result = 1
  for i in 2 .. n: result *= i

proc comb(n, k: int): int = fact(n) div (fact(k) * fact(n - k))

const n = 5
var parts: seq[string]
for k in 1 .. n:
  parts.add $(comb(n - 1, k - 1) * fact(n) div fact(k))
echo parts.join(" ")
