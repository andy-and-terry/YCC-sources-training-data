# Emirps below 200; expect 15.
import strutils, algorithm
proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

proc rev(n: int): int = parseInt(($n).reversed.join)

var found: seq[int]
for n in 2 ..< 200:
  if rev(n) != n and isPrime(n) and isPrime(rev(n)): found.add n
echo found.len, " ", found
