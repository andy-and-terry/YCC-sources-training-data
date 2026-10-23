-- Thue-Morse: t(n) is the parity of the number of 1 bits in n
local function parity(n)
  local p = 0
  while n > 0 do
    p = p ~ (n & 1)
    n = n >> 1
  end
  return p
end

local out = {}
for n = 0, 31 do out[#out + 1] = parity(n) end
print(table.concat(out))
