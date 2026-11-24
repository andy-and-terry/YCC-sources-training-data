# Moser-de Bruijn sequence: binary digits of n read in base 4.
import std/strutils
proc moser(start: int): int =
  var n = start
  var place = 1
  while n > 0:
    if (n and 1) == 1: result += place
    n = n shr 1
    place *= 4

var parts: seq[string]
for n in 0 ..< 12: parts.add $moser(n)
echo parts.join(" ")
