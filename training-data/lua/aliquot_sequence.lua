local function proper_divisor_sum(n)
  local sum = 0
  for d = 1, math.floor(n / 2) do
    if n % d == 0 then
      sum = sum + d
    end
  end
  return sum
end

local n = 12
local seq = { n }
while n ~= 0 do
  n = proper_divisor_sum(n)
  seq[#seq + 1] = n
end
print(table.concat(seq, " "))
