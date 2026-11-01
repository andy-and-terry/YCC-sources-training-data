-- Evil numbers have an even number of 1 bits.
local function popcount(n)
  local c = 0
  while n > 0 do
    c = c + n % 2
    n = n // 2
  end
  return c
end

local out = {}
for n = 0, 20 do
  if popcount(n) % 2 == 0 then out[#out + 1] = n end
end
print(table.concat(out, " "))
