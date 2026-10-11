import std/strutils

echo "42".align(6, '0')
echo "ab".alignLeft(6, '.') & "|"
echo "x".center(7, '*')
echo 255.toHex(4)
echo 10.toBin(8)
echo 64.toOct(4)
echo formatFloat(3.14159, ffDecimal, 2)
echo formatFloat(1234567.0, ffScientific, 3)
echo intToStr(7, 3)
echo insertSep("1234567", ',')
