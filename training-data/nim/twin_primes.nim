# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
import strutils

proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

var parts: seq[string]
for p in 2 ..< 100:
  if isPrime(p) and isPrime(p + 2):
    parts.add $p
echo parts.join(" ")
