import std/bitops

# Bit-counting helpers from std/bitops
let x = 0b1011_0110'u32
echo "value:        ", x
echo "popcount:     ", popcount(x)
echo "parity:       ", parityBits(x)
echo "leading zero: ", countLeadingZeroBits(x)
echo "trailing zero:", countTrailingZeroBits(x)
echo "first set:    ", firstSetBit(x)   # 1-based index

# Power-of-two check using the classic n and (n - 1) trick
proc isPow2(n: uint32): bool = n != 0 and (n and (n - 1)) == 0
for n in [1'u32, 6, 8, 64, 100]:
  echo n, " power of two? ", isPow2(n)

# Rotation and bit slicing
echo rotateLeftBits(0x80000001'u32, 1)
echo x.bitsliced(2 .. 5)
var y = x
y.setBit(0)
y.clearBit(1)
echo y.toBin(8)
