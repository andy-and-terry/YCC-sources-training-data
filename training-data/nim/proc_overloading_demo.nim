proc describe(x: int): string = "int " & $x
proc describe(x: float): string = "float " & $x
proc describe(x: string): string = "string '" & x & "'"
proc describe[T](xs: seq[T]): string =
  result = "seq of " & $xs.len & ":"
  for x in xs:
    result.add " " & describe(x)

proc area(r: float): float = 3.14159 * r * r
proc area(w, h: float): float = w * h

echo describe(3)
echo describe(2.5)
echo describe("hi")
echo describe(@[1, 2, 3])
echo describe(@["a", "b"])
echo area(2.0)
echo area(3.0, 4.0)
