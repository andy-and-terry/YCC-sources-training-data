import strutils, sequtils

proc isPrime(n: int): bool =
  if n < 2: return false
  var i = 2
  while i * i <= n:
    if n mod i == 0: return false
    inc i
  true

var found: seq[int]
var p = 2
while found.len < 10:
  if isPrime(p) and isPrime(2 * p + 1): found.add p
  inc p
echo found.mapIt($it).join(" ") # 2 3 5 11 23 29 41 53 83 89
