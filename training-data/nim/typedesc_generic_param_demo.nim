proc zero(T: typedesc[SomeNumber]): T = T(0)
proc nameOf(T: typedesc): string = $T

echo zero(int), " ", zero(float), " ", zero(uint8)
echo nameOf(string), " ", nameOf(seq[int])

proc sizeOfAll(T: typedesc, n: int): int = sizeof(T) * n
echo sizeOfAll(int32, 10)
echo default(int), " ", default(string).len, " ", default(bool)
