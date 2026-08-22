proc fibonacci(n: int): seq[int] =
  result = @[]
  var a = 0
  var b = 1
  for i in 0 ..< n:
    result.add(a)
    let temp = a + b
    a = b
    b = temp

echo fibonacci(11)
