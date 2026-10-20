iterator countdown(n: int): int =
  var i = n
  while i > 0:
    yield i
    dec i

iterator pairs2[T](xs: seq[T]): (int, T) =
  for i in 0 ..< xs.len: yield (i, xs[i])

proc makeCounter(): proc(): int =
  var n = 0
  return proc(): int =
    inc n
    n

proc apply(f: proc(x: int): int, v: int): int = f(v)

for v in countdown(3): echo v
for i, x in pairs2(@["a", "b"]): echo i, x
let c = makeCounter()
discard c()
echo c()
echo apply(proc(x: int): int = x * x, 7)
echo apply((x) => x + 1, 1)
proc divmod(a, b: int): (int, int) = (a div b, a mod b)
let (q, r) = divmod(17, 5)
echo q, " ", r
proc greet(name: string, greeting = "Hello"): string = greeting & ", " & name
echo greet("Ada"), " ", greet("Bo", greeting = "Hi")
