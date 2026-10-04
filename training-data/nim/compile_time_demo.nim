const
  squares = block:
    var t: array[8, int]
    for i in 0 ..< t.len: t[i] = i * i
    t

proc fib(n: int): int =
  if n < 2: n else: fib(n - 1) + fib(n - 2)

# evaluated by the compiler's VM
const fib20 = fib(20)

static:
  echo "this line is printed at compile time"

when defined(windows):
  const platform = "windows"
elif defined(linux):
  const platform = "linux"
else:
  const platform = "other"

echo squares
echo fib20
echo platform
echo "compiled with Nim ", NimVersion
