import std/strutils

proc fletcher16(data: string): int =
  var s1, s2 = 0
  for c in data:
    s1 = (s1 + ord(c)) mod 255
    s2 = (s2 + s1) mod 255
  (s2 shl 8) or s1

echo toHex(fletcher16("abcde"), 4).toLowerAscii
