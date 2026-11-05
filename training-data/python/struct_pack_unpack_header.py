import struct

packed = struct.pack("<HIf", 7, 100000, 1.5)
print(packed.hex(), struct.calcsize("<HIf"))
print(struct.unpack("<HIf", packed))
