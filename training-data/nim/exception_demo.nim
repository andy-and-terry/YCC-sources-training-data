type
  DivisionByZeroError = object of CatchableError

proc safeDivide(a, b: int): int =
  if b == 0:
    raise newException(DivisionByZeroError, "cannot divide by zero")
  return a div b

try:
  echo safeDivide(10, 2)
  echo safeDivide(5, 0)
except DivisionByZeroError as e:
  echo "error: " & e.msg
