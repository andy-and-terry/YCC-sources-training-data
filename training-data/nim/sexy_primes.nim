# Sexy primes below 100; expect 16 pairs.
proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

var c = 0
for p in 2 ..< 100:
  if isPrime(p) and isPrime(p + 6): inc c
echo c
