proc minMax(xs: openArray[int]): tuple[lo, hi: int] =
  result = (xs[0], xs[0])
  for x in xs:
    if x < result.lo: result.lo = x
    if x > result.hi: result.hi = x

let (lo, hi) = minMax([4, 9, -2, 7])
echo "lo=", lo, " hi=", hi

var a = 1
var b = 2
(a, b) = (b, a)
echo a, " ", b

let person = (name: "Ada", age: 36)
echo person.name, " is ", person.age
for (k, v) in [("x", 1), ("y", 2)]:
  echo k, "=", v
