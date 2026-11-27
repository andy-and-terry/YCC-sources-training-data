import std/bitops

proc gould(n: int): int = 1 shl countSetBits(n)

for n in 0 ..< 16:
  stdout.write gould(n), " "
echo ""
