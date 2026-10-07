import struct

# little-endian: unsigned short, int, float, 4-byte string
packed = struct.pack("<Hif4s", 513, -7, 1.5, b"abcd")
print(packed.hex(), len(packed), struct.calcsize("<Hif4s"))
print(struct.unpack("<Hif4s", packed))

header = struct.pack(">BBH", 1, 2, 0xBEEF)
print(header.hex())
version, kind, magic = struct.unpack(">BBH", header)
print(version, kind, hex(magic))

print(int.from_bytes(b"\x01\x00", "little"), (258).to_bytes(2, "big"))
