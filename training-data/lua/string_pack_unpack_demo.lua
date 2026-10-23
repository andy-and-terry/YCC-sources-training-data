-- string.pack / string.unpack (Lua 5.3+) serialize values to binary strings.
-- Format characters: < little-endian, > big-endian, i4 = 4-byte int,
-- s1 = string with a 1-byte length prefix, z = zero-terminated string.
local function hex(s)
  return (s:gsub(".", function(c) return string.format("%02x", c:byte()) end))
end

local packed = string.pack("<i4", 258)
print(hex(packed), #packed)

print(hex(string.pack(">i4", 258)))
print(hex(string.pack("<I2", 65535)))
print(hex(string.pack("<d", 1.5)))

-- Record: id (u16), name (length-prefixed), score (float).
local record = string.pack("<I2 s1 f", 7, "lua", 9.5)
print(#record, hex(record))

local id, name, score, nextpos = string.unpack("<I2 s1 f", record)
print(id, name, score, nextpos)

-- Zero-terminated strings and reading from an offset.
local blob = string.pack("zz", "key", "value")
local k, pos = string.unpack("z", blob)
local v = string.unpack("z", blob, pos)
print(k, v, string.packsize("<i4 i8"))

-- Round trip a signed value.
local neg = string.pack("<i2", -2)
print(hex(neg), (string.unpack("<i2", neg)))
