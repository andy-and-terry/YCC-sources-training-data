proc maxOf[T](xs: openArray[T]): T =
  result = xs[0]
  for x in xs:
    if x > result: result = x
echo maxOf([3, 9, 4])
echo maxOf(@["a", "z", "m"])
