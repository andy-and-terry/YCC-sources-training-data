local function varint(n)
  local out = {}
  while n >= 128 do
    out[#out + 1] = (n & 127) | 128
    n = n >> 7
  end
  out[#out + 1] = n
  return out
end

local parts = {}
for _, b in ipairs(varint(300)) do parts[#parts + 1] = string.format("%02x", b) end
print(table.concat(parts, " "))
