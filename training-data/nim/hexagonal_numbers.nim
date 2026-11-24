# Hexagonal numbers: n(2n-1).
import std/strutils
var parts: seq[string]
for n in 1 .. 10: parts.add $(n * (2 * n - 1))
echo parts.join(" ")
