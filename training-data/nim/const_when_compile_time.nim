const squares = block:
  var a: array[5, int]
  for i in 0 ..< 5: a[i] = i * i
  a
when defined(linux): echo "linux"
else: echo "other"
echo squares
