import std/[math, strformat]

proc secant(f: proc (x: float): float, a, b: float): float =
  var x0 = a
  var x1 = b
  for _ in 1 .. 50:
    let f0 = f(x0)
    let f1 = f(x1)
    if f1 == f0: break
    let next = x1 - f1 * (x1 - x0) / (f1 - f0)
    x0 = x1
    x1 = next
    if abs(x1 - x0) < 1e-12: break
  x1

echo &"{secant(proc (x: float): float = x * x - 2, 1.0, 2.0):.10f}"
