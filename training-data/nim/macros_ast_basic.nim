import macros

macro dbg(x: untyped): untyped =
  let s = x.toStrLit
  result = quote do:
    echo `s`, " = ", `x`

macro makeGetter(name: untyped, val: typed): untyped =
  result = quote do:
    proc `name`(): auto = `val`

dbg 1 + 2 * 3
dbg "abc".len
makeGetter(answer, 42)
echo answer()

macro unrolled(n: static int, body: untyped): untyped =
  result = newStmtList()
  for i in 0 ..< n: result.add(copyNimTree(body))
var c = 0
unrolled(3):
  inc c
echo c
template benchmark(name: string, body: untyped) =
  echo name, " ran"
  body
benchmark "sum": discard 1 + 1
const compileTimeSquare = static: 12 * 12
echo compileTimeSquare
echo astToStr(a + b)
