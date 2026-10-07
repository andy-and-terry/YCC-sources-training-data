type
  Point = tuple[x, y: int]

proc minMax(xs: openArray[int]): tuple[lo, hi: int] =
  result = (lo: xs[0], hi: xs[0])
  for x in xs:
    if x < result.lo: result.lo = x
    if x > result.hi: result.hi = x

let p: Point = (x: 3, y: 4)
echo p.x + p.y
echo p

let (lo, hi) = minMax([5, 2, 9, -1, 7])
echo "lo=", lo, " hi=", hi

var (a, b) = (1, 2)
(a, b) = (b, a)
echo a, " ", b

for (i, ch) in "abc".pairs:
  echo i, ":", ch
