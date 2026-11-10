-- Read the binary digits of i as base-4 digits.
local function moser_de_bruijn(i)
  local value, power = 0, 1
  while i > 0 do
    if i & 1 == 1 then value = value + power end
    power = power * 4
    i = i >> 1
  end
  return value
end

local out = {}
for i = 0, 9 do out[#out + 1] = moser_de_bruijn(i) end
print(table.concat(out, " ")) -- 0 1 4 5 16 17 20 21 64 65
