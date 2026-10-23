import strutils

proc zeckendorf(n: int): seq[int] =
  var fibs = @[1, 2]
  while fibs[^1] + fibs[^2] <= n:
    fibs.add(fibs[^1] + fibs[^2])
  var rest = n
  for i in countdown(fibs.high, 0):
    if fibs[i] <= rest:
      result.add(fibs[i])
      rest -= fibs[i]

var parts: seq[string]
for f in zeckendorf(100):
  parts.add($f)
echo parts.join(" ")
