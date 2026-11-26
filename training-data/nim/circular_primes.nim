# Circular primes below 100; expect 13.
import strutils
proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

proc circular(n: int): bool =
  let s = $n
  for i in 0 ..< s.len:
    if not isPrime(parseInt(s[i .. ^1] & s[0 ..< i])): return false
  true

var c = 0
for n in 2 ..< 100:
  if circular(n): inc c
echo c
