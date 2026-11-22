# Sophie Germain primes: p prime and 2p + 1 prime.
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
  if isPrime(p) and isPrime(2 * p + 1):
    parts.add $p
echo parts.join(" ")
