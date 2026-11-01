import std/[bitops, strutils]

proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

# Pernicious numbers: the popcount is prime.
var vals: seq[string]
for n in 1 .. 20:
  if isPrime(countSetBits(n)): vals.add $n
echo vals.join(" ")
