# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
import std/algorithm

proc isBouncy(n: int): bool =
  let d = $n
  var up = d
  up.sort()
  var down = d
  down.sort(SortOrder.Descending)
  d != up and d != down

var count = 0
for n in 1 ..< 1000:
  if isBouncy(n): inc count
echo count
