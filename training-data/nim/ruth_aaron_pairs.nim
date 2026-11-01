import std/strutils

# Sum of prime factors counted with multiplicity.
proc sopfr(start: int): int =
  var n = start
  var p = 2
  while p * p <= n:
    while n mod p == 0:
      result += p
      n = n div p
    inc p
  if n > 1: result += n

var vals: seq[string]
for n in 2 ..< 110:
  if sopfr(n) == sopfr(n + 1): vals.add $n
echo vals.join(" ")
