import strutils

proc crc8(data: string): uint8 =
  var crc: uint8 = 0
  for ch in data:
    crc = crc xor uint8(ord(ch))
    for _ in 0 ..< 8:
      crc = if (crc and 0x80'u8) != 0: (crc shl 1) xor 0x07'u8 else: crc shl 1
  crc

echo toHex(int(crc8("123456789")), 2)
