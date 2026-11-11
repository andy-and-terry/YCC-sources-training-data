# Population count (number of set bits) for 0..15
import std/bitops

for n in 0 .. 15:
  stdout.write popcount(n), " "
echo ""
