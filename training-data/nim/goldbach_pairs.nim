# Goldbach partitions of 100; expect 6.
proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

var pairs: seq[(int, int)]
for p in 2 .. 50:
  if isPrime(p) and isPrime(100 - p): pairs.add (p, 100 - p)
echo pairs.len, " ", pairs
