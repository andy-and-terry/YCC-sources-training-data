template unless(cond: bool, body: untyped) =
  if not cond:
    body

template twice(body: untyped) =
  body
  body

unless 1 > 2:
  echo "one is not greater"
twice:
  echo "hello"
