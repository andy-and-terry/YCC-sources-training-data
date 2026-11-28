import std/bitops

proc popcount(n: uint64): int =
  var x = n
  while x != 0:
    x = x and (x - 1)
    inc result

echo popcount(0xB7'u64), " ", countSetBits(0xB7'u64)
