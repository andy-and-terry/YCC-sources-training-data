# Emirps: primes whose digit reversal is a different prime.
import strutils, algorithm

proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

proc reverseNum(n: int): int =
  var s = $n
  s.reverse()
  parseInt(s)

var parts: seq[string]
for n in 2 ..< 200:
  let r = reverseNum(n)
  if r != n and isPrime(n) and isPrime(r):
    parts.add $n
echo parts.join(" ")
