proc fib(n: int): int =
  if n < 2: n else: fib(n - 1) + fib(n - 2)

const fib20 = fib(20)

const squares = block:
  var table: array[8, int]
  for i in 0 ..< 8:
    table[i] = i * i
  table

static:
  echo "this prints at compile time"

when defined(release):
  const mode = "release"
else:
  const mode = "debug"

echo "fib(20) = ", fib20
echo squares
echo "build mode: ", mode
echo "int size: ", sizeof(int)
