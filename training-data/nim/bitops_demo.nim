import std/bitops

let x = 0b1011_0100'u32
echo popcount(x)
echo countTrailingZeroBits(x)
echo countLeadingZeroBits(x)
echo x.testBit(2)
echo rotateLeftBits(x, 4)
echo x and not 0b100'u32
echo parityBits(x)
