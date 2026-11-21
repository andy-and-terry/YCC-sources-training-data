-- Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
local function is_keith(n)
  local seq = {}
  for c in tostring(n):gmatch("%d") do seq[#seq + 1] = tonumber(c) end
  local k = #seq
  while seq[#seq] < n do
    local sum = 0
    for i = #seq - k + 1, #seq do sum = sum + seq[i] end
    seq[#seq + 1] = sum
  end
  return seq[#seq] == n
end

local out = {}
for n = 10, 1199 do
  if is_keith(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
