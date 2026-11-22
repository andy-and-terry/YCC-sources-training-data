# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
import strutils

var r = 0
var parts: seq[string]
for _ in 1 .. 8:
  r = r * 10 + 1
  parts.add $r
echo parts.join(" ")
