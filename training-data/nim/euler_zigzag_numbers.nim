# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
import strutils

var row = @[1]
var parts = @["1"]
for _ in 1 .. 9:
  var next = @[0]
  for j in countdown(row.high, 0):
    next.add next[^1] + row[j]
  row = next
  parts.add $row[^1]
echo parts.join(" ")
