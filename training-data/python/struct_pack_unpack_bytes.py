import struct

# struct converts between Python values and packed C-style bytes.
# '<' = little endian, no padding; I = uint32, H = uint16, B = uint8, f = float32
fmt = "<IHB"
packed = struct.pack(fmt, 0xDEADBEEF, 513, 7)
print(packed, len(packed), struct.calcsize(fmt))
print(packed.hex(" "))

magic, version, flags = struct.unpack(fmt, packed)
print(hex(magic), version, flags)

# Big endian network order for comparison.
print(struct.pack(">H", 513).hex(), struct.pack("<H", 513).hex())

# Fixed-width strings use 's'; they are padded with NUL bytes.
header = struct.pack("<4sf", b"PNG", 1.5)
print(header)
tag, ratio = struct.unpack("<4sf", header)
print(tag.rstrip(b"\x00"), ratio)

# unpack_from reads at an offset inside a larger buffer.
buf = b"\x00\x00" + packed
print(struct.unpack_from(fmt, buf, 2))

# int.from_bytes / to_bytes cover the single-integer case.
print(int.from_bytes(b"\x01\x02", "big"), (258).to_bytes(2, "little"))
