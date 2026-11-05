proc maxOf[T: SomeNumber](a, b: T): T =
  if a > b: a else: b

echo maxOf(3, 8)
echo maxOf(2.5, 1.5)
