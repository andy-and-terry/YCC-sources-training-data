iterator fibonacci(): int {.closure.} =
  var a = 0
  var b = 1
  while true:
    yield a
    let temp = a + b
    a = b
    b = temp

var gen = fibonacci
for i in 1 .. 8:
  echo gen()
