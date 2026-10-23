local packed = string.pack("<I4", 258)
print(#packed, packed:byte(1, -1))

local big = string.pack(">I4", 258)
print(big:byte(1, -1))

local record = string.pack("<i2 z s1", -2, "hi", "abc")
print(#record)
local n, name, tag, nextpos = string.unpack("<i2 z s1", record)
print(n, name, tag, nextpos)

print(string.packsize("<i4 i8"))
print(string.unpack("<d", string.pack("<d", 3.5)))
