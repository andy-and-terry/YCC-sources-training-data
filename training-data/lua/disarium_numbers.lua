-- Disarium numbers: digits raised to their 1-based positions sum to n.
local function is_disarium(n)
  local sum, i = 0, 0
  for c in tostring(n):gmatch("%d") do
    i = i + 1
    sum = sum + tonumber(c) ^ i
  end
  return sum == n
end

local out = {}
for n = 1, 999 do
  if is_disarium(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
