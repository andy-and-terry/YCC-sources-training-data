import std/math

var big = high(int)
echo big
try:
  echo big + 1
except OverflowDefect:
  echo "overflow caught"

echo big +% 1
var small = 250'u8
small = small +% 10
echo small
echo int8(127).int + 1
echo high(uint32), " ", low(int16)
