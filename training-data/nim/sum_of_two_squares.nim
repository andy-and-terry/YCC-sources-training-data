import std/[math, strutils]

# Positive n expressible as a*a + b*b with a, b >= 0.
proc representable(n: int): bool =
  var a = 0
  while a * a <= n:
    let b = int(round(sqrt(float(n - a * a))))
    if a * a + b * b == n: return true
    inc a
  false

var vals: seq[string]
for n in 1 .. 30:
  if representable(n): vals.add $n
echo vals.join(" ")
