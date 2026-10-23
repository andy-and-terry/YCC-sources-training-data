# Dense integer sets with std/intsets
import std/[intsets, algorithm]

var a = initIntSet()
var b = initIntSet()
for i in 1 .. 10:
  if i mod 2 == 0: a.incl(i)
  if i mod 3 == 0: b.incl(i)

echo 6 in a
echo 7 in a
echo a.len

let both = a * b
let either = a + b
let onlyA = a - b

proc sortedItems(s: IntSet): seq[int] =
  for x in s: result.add x
  result.sort()

echo sortedItems(both)
echo sortedItems(either)
echo sortedItems(onlyA)
