import std/[math, strutils]

# n is triangular iff 8n + 1 is a perfect square.
proc isTriangular(n: int): bool =
  let s = 8 * n + 1
  let r = int(round(sqrt(float(s))))
  r * r == s

var vals: seq[string]
for n in 0 .. 20:
  if isTriangular(n): vals.add $n
echo vals.join(" ")
