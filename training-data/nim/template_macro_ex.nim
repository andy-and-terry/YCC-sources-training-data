template twice(body: untyped) =
  body
  body

template timesDo(n: int, body: untyped) =
  for _ in 0 ..< n: body

var c = 0
twice: inc c
timesDo(3): inc c, 10
echo c
