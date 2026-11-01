import std/[math, strutils]

# Leyland numbers: x^y + y^x for x >= y >= 2.
proc leyland(x, y: int): int = x ^ y + y ^ x

var vals: seq[string]
for x in 2 .. 4:
  for y in 2 .. x:
    vals.add $leyland(x, y)
echo vals.join(" ")
