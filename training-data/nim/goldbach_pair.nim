# Goldbach pair returning a tuple.
import options

proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

proc goldbach(n: int): Option[(int, int)] =
  for p in 2 .. n div 2:
    if isPrime(p) and isPrime(n - p): return some((p, n - p))

echo goldbach(28)
