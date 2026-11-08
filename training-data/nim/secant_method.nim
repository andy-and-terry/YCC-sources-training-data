import strformat

proc secant(f: proc(x: float): float, a0, b0: float): float =
  var a = a0
  var b = b0
  for _ in 0 ..< 40:
    let fa = f(a)
    let fb = f(b)
    if abs(fb - fa) < 1e-15: break
    let c = b - fb * (b - a) / (fb - fa)
    a = b
    b = c
  b

echo &"{secant(proc(x: float): float = x * x - 2, 1.0, 2.0):.8f}"
