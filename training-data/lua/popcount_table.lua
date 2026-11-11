-- Population count (number of set bits) for 0..15
local function bits(n)
  local c = 0
  while n > 0 do
    c = c + (n % 2)
    n = n // 2
  end
  return c
end

local out = {}
for n = 0, 15 do out[#out + 1] = bits(n) end
print(table.concat(out, " "))
