template unless(cond: bool, body: untyped) =
  if not cond:
    body

template benchmarkLoop(n: int, body: untyped) =
  for i {.inject.} in 0 ..< n:
    body

proc `|>`[T, U](x: T, f: proc (a: T): U): U = f(x)

proc double(x: int): int = x * 2
proc inc1(x: int): int = x + 1

unless 3 > 5:
  echo "3 is not greater than 5"

var total = 0
benchmarkLoop(4):
  total += i
echo "total: ", total

echo 5 |> double |> inc1
