# Pentagonal numbers: n(3n-1)/2.
import std/strutils
var parts: seq[string]
for n in 1 .. 10: parts.add $(n * (3 * n - 1) div 2)
echo parts.join(" ")
