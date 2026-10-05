proc fib(n: int): int =
  if n < 2: n else: fib(n - 1) + fib(n - 2)

const fib20 = fib(20)          # evaluated at compile time
const squares = block:
  var s: array[6, int]
  for i in 0..5: s[i] = i * i
  s

static:
  echo "compiling..."

when defined(release):
  echo "release build"
else:
  echo "debug build"
echo fib20
echo squares
