import std/strutils

# Ways to write n as a sum of two or more consecutive positive integers.
proc politeWays(n: int): int =
  var k = 2
  while k * (k + 1) div 2 <= n:
    if (n - k * (k - 1) div 2) mod k == 0: inc result
    inc k

var vals: seq[string]
for n in 1 .. 16:
  vals.add $politeWays(n)
echo vals.join(" ")
