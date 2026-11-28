local function popcount(n)
  local c = 0
  while n > 0 do c = c + (n & 1); n = n >> 1 end
  return c
end

local out = {}
for n = 0, 15 do out[#out + 1] = 1 << popcount(n) end
print(table.concat(out, " "))
