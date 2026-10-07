proc fib(n: int): int =
  if n < 2: n else: fib(n - 1) + fib(n - 2)

# evaluated by the compiler, embedded as a literal
const fib20 = fib(20)
const squares = block:
  var s: array[5, int]
  for i in 0 ..< 5: s[i] = i * i
  s

echo fib20
echo squares
static:
  echo "this prints at compile time"
