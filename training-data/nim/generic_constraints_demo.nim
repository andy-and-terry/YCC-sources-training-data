proc maxOf[T: SomeNumber](a, b: T): T =
  if a > b: a else: b

proc sumAll[T: SomeInteger | SomeFloat](xs: openArray[T]): T =
  for x in xs: result += x

proc describe[T](x: T): string =
  when T is int: "int " & $x
  elif T is string: "string " & x
  else: "other"

echo maxOf(3, 9), " ", maxOf(2.5, 1.5)
echo sumAll([1, 2, 3]), " ", sumAll([0.5, 0.25])
echo describe(1), "; ", describe("s"), "; ", describe(1.5)
