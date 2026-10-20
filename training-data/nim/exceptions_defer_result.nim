type MyError = object of CatchableError
  code: int

proc risky(n: int): int =
  if n < 0: raise newException(ValueError, "negative")
  if n == 0: raise (ref MyError)(msg: "zero", code: 42)
  result = 100 div n

for v in [5, -1, 0]:
  try:
    echo risky(v)
  except ValueError as e:
    echo "value: ", e.msg
  except MyError as e:
    echo "mine: ", e.msg, " ", e.code
  finally:
    echo "done ", v

proc withDefer() =
  defer: echo "deferred"
  echo "body"
withDefer()

try:
  discard parseInt("x")
except ValueError:
  echo "parse failed: ", getCurrentExceptionMsg()

import options
proc find(xs: seq[int], t: int): Option[int] =
  for i, x in xs:
    if x == t: return some(i)
  none(int)
echo find(@[1, 2, 3], 2), " ", find(@[1], 9).isNone, " ", find(@[4], 4).get()
try:
  doAssert 1 + 1 == 3, "math"
except AssertionDefect:
  echo "assertion"
