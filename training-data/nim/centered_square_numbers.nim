# Centered square numbers: n^2 + (n+1)^2.
import std/strutils
var parts: seq[string]
for n in 0 ..< 10: parts.add $(n * n + (n + 1) * (n + 1))
echo parts.join(" ")
