import std/tables

proc memoize[T](f: proc (x: int): T): proc (x: int): T =
  var cache = initTable[int, T]()
  result = proc (x: int): T =
    if not cache.hasKey(x):
      cache[x] = f(x)
    cache[x]

proc slowSquare(x: int): int =
  echo "computing square of ", x
  x * x

let fastSquare = memoize(slowSquare)
echo fastSquare(4)
echo fastSquare(4)
echo fastSquare(5)
