proc sum(xs: openArray[int]): int =
  for x in xs: result += x

proc average(xs: openArray[float]): float =
  var total = 0.0
  for x in xs: total += x
  total / xs.len.float

let s = @[1, 2, 3, 4]
let a = [10, 20, 30]
echo sum(s), " ", sum(a), " ", sum(s[1..2])
echo average([1.0, 2.0, 4.5])
