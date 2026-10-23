import std/unittest

proc clamp01(x: float): float =
  if x < 0.0: 0.0
  elif x > 1.0: 1.0
  else: x

proc safeDiv(a, b: int): int =
  if b == 0:
    raise newException(DivByZeroDefect, "division by zero")
  a div b

suite "clamp01":
  test "values inside range are unchanged":
    check clamp01(0.5) == 0.5

  test "values outside range are clipped":
    check clamp01(-3.0) == 0.0
    check clamp01(7.5) == 1.0

suite "safeDiv":
  setup:
    let base = 100

  test "divides normally":
    check safeDiv(base, 5) == 20

  test "raises on zero":
    expect DivByZeroDefect:
      discard safeDiv(base, 0)
