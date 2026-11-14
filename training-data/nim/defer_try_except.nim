proc risky(n: int) =
  defer: echo "cleanup"
  if n < 0: raise newException(ValueError, "negative")
  echo "ok ", n

try:
  risky(1)
  risky(-1)
except ValueError as e:
  echo "caught: ", e.msg
