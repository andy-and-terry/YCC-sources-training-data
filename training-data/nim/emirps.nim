import strutils, sequtils

proc isPrime(n: int): bool =
  if n < 2: return false
  var i = 2
  while i * i <= n:
    if n mod i == 0: return false
    inc i
  true

proc reverseNum(n: int): int = parseInt(($n).reversed.join)

var out: seq[int]
var n = 2
while out.len < 10:
  let r = reverseNum(n)
  if r != n and isPrime(n) and isPrime(r): out.add n
  inc n
echo out.mapIt($it).join(" ") # 13 17 31 37 71 73 79 97 107 113
