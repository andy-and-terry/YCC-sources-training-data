# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
import std/math

proc phi(n: int): int =
  for k in 1 .. n:
    if gcd(k, n) == 1: inc result

proc isPerfectTotient(n: int): bool =
  var total = 0
  var m = n
  while m > 1:
    m = phi(m)
    total += m
  total == n

for n in 2 ..< 200:
  if isPerfectTotient(n): stdout.write n, " "
echo ""
