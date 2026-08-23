proc binaryToDecimal(s: string): int =
  result = parseBinInt(s)

import strutils
echo binaryToDecimal("1011")
