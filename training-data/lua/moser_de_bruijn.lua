-- Moser-de Bruijn sequence: binary digits of n read in base 4.
local function moser(n)
  local result, place = 0, 1
  while n > 0 do
    if n & 1 == 1 then result = result + place end
    n = n >> 1
    place = place * 4
  end
  return result
end

local out = {}
for n = 0, 11 do out[#out + 1] = moser(n) end
print(table.concat(out, " "))
