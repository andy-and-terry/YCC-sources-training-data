import std/strutils

proc double(x: int): int = x * 2
proc addN(x, n: int): int = x + n

echo double(4)
echo 4.double
echo 4.double.addN(1)
echo "  hi ".strip.toUpperAscii
echo @[3, 1, 2].len
echo 10.addN(5)
