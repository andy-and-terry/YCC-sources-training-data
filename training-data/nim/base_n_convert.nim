import strutils

for b in [2, 8, 16, 36]:
  let digits = "0123456789abcdefghijklmnopqrstuvwxyz"
  var n = 255
  var s = ""
  while n > 0:
    s = digits[n mod b] & s
    n = n div b
  echo "255 in base ", b, " = ", s

echo parseHexInt("ff"), " ", parseBinInt("1010"), " ", parseOctInt("377")
