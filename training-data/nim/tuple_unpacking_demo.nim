import std/tables

proc minMax(xs: openArray[int]): tuple[lo, hi: int] =
  result = (xs[0], xs[0])
  for x in xs:
    if x < result.lo: result.lo = x
    if x > result.hi: result.hi = x

let (lo, hi) = minMax([4, 9, -2, 7])
echo "lo=", lo, " hi=", hi

var (a, b) = (1, 2)
(a, b) = (b, a)
echo a, " ", b

let person = (name: "Ada", born: 1815)
echo person.name, " born ", person.born

let pairs = {"x": 1, "y": 2}.toTable
for k, v in pairs.pairs:
  echo k, " -> ", v

for (i, ch) in "abc".pairs:
  echo i, ":", ch
