type MyError = object of CatchableError

proc risky(n: int) =
  if n < 0: raise newException(MyError, "negative")

try:
  risky(-1)
except MyError as e:
  echo "caught: ", e.msg
finally:
  echo "done"
