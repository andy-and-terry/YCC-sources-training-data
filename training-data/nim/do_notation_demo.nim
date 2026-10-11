import std/[sequtils, algorithm]

var xs = @[5, 2, 8, 1]
xs.sort do (a, b: int) -> int:
  cmp(b, a)
echo xs

let evens = xs.filter do (x: int) -> bool:
  x mod 2 == 0
echo evens

proc withRetry(n: int, body: proc (i: int): bool): int =
  for i in 1 .. n:
    if body(i): return i
  -1
echo withRetry(5) do (i: int) -> bool:
  i * i > 10
