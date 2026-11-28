import std/[strutils, algorithm]

proc isPrime(n: int): bool =
  if n < 2: return false
  var i = 2
  while i * i <= n:
    if n mod i == 0: return false
    inc i
  true

proc rev(n: int): int = parseInt(($n).reversed.join)

for p in 2 ..< 100:
  if isPrime(p) and rev(p) != p and isPrime(rev(p)):
    stdout.write p, " "
echo ""
