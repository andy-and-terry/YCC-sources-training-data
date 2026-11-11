# Fermat primality test; Carmichael number 561 fools it.
proc powmod(b, e, m: int): int =
  result = 1
  var base = b mod m
  var exp = e
  while exp > 0:
    if (exp and 1) == 1: result = result * base mod m
    base = base * base mod m
    exp = exp shr 1

proc probablyPrime(n: int): bool =
  n > 2 and powmod(2, n - 1, n) == 1

for n in [97, 91, 561]:
  echo n, " ", probablyPrime(n)
