proc maxOf[T](xs: openArray[T]): T =
  result = xs[0]
  for x in xs:
    if x > result: result = x

template twice(body: untyped) =
  body
  body

template swap2(a, b: untyped) =
  let tmp = a
  a = b
  b = tmp

type Addable = concept x, y
  x + y is type(x)

proc total[T: Addable](xs: seq[T]): T =
  for x in xs: result = result + x

echo maxOf([3, 9, 4]), " ", maxOf(["b", "z", "a"])
var i = 0
twice: inc i
echo i
var a = 1
var b = 2
swap2(a, b)
echo a, b
echo total(@[1, 2, 3]), " ", total(@[1.5, 2.5])
