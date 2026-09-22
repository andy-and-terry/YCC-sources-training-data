import macros

macro debug(x: untyped): untyped =
  let label = x.toStrLit
  result = quote do:
    echo `label`, " = ", `x`

let a = 5
let b = 10
debug(a + b)
debug(a * b - 2)
