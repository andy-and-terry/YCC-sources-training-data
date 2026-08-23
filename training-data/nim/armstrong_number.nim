import strutils, math

proc isArmstrong(n: int): bool =
  let digitsStr = $n
  let power = digitsStr.len
  var total = 0
  for c in digitsStr:
    total += ((c.ord - '0'.ord) ^ power)
  result = total == n

echo isArmstrong(153)
echo isArmstrong(154)
