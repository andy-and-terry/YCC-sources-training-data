data = bytearray(b"abcdefghij")
mv = memoryview(data)
part = mv[2:6]
print(bytes(part), len(part), part.nbytes)

part[0] = ord("X")  # writes through to the original buffer
print(data)

nums = memoryview(bytes([1, 2, 3, 4, 5, 6])).cast("H")
print(nums.tolist(), nums.format)

import struct
print(struct.unpack("<I", bytes(mv[0:4]))[0] > 0)
print(mv.readonly, memoryview(b"ro").readonly)
mv.release()
