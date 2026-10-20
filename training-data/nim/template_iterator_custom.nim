iterator countdown(n: int): int =
  var i = n
  while i > 0:
    yield i
    dec i

template twice(body: untyped) =
  body
  body

for v in countdown(3): echo v
twice: echo "hi"
