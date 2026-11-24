# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
import std/strutils
proc mobius(start: int): int =
  var n = start
  result = 1
  var p = 2
  while p * p <= n:
    if n mod p == 0:
      n = n div p
      if n mod p == 0: return 0
      result = -result
    inc p
  if n > 1: result = -result

var parts: seq[string]
for n in 1 .. 30: parts.add $mobius(n)
echo parts.join(" ")
