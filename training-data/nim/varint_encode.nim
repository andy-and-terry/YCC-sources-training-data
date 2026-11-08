import strutils

proc varint(n: uint): seq[byte] =
  var v = n
  while v >= 0x80:
    result.add byte((v and 0x7F) or 0x80)
    v = v shr 7
  result.add byte(v)

for b in varint(300): stdout.write toHex(int(b), 2), " "
echo ""
