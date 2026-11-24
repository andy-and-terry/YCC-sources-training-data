# Fibbinary numbers: no two adjacent 1 bits.
import std/strutils
var parts: seq[string]
for n in 0 ..< 50:
  if (n and (n shr 1)) == 0: parts.add $n
echo parts.join(" ")
