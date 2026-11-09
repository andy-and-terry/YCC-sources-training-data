proc maxOf[T](a, b: T): T =
  if a > b: a else: b

template twice(body: untyped) =
  body
  body

echo maxOf(3, 9)
echo maxOf("a", "b")
twice: echo "hi"
