proc describe[T](x: T): string = $x & " : " & $T
proc describe(x: bool): string = (if x: "yes" else: "no")

echo describe(5)
echo describe("hi")
echo describe(true)
