-- Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
local function is_munchausen(n)
  local sum = 0
  for c in tostring(n):gmatch("%d") do
    local d = tonumber(c)
    if d > 0 then sum = sum + d ^ d end
  end
  return sum == n
end

local out = {}
for n = 1, 4999 do
  if is_munchausen(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
