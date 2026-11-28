proc reverseBits(value: uint8): uint8 =
  var v = value
  for _ in 0 ..< 8:
    result = (result shl 1) or (v and 1)
    v = v shr 1

for v in [1'u8, 6, 13, 128]:
  echo v, " ", reverseBits(v) # 128 96 176 1
