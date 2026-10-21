# P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
iterator pell(count: int): int =
  var (a, b) = (0, 1)
  for _ in 1 .. count:
    yield a
    (a, b) = (b, 2 * b + a)

var i = 0
for p in pell(15):
  echo "P(", i, ") = ", p
  inc i
