-- Practical numbers: every m in 1..n is a sum of distinct divisors of n.
local function is_practical(n)
  local reach = 1 -- bit i set <=> i is a subset sum
  for d = 1, n do
    if n % d == 0 then reach = reach | (reach << d) end
  end
  local mask = (1 << (n + 1)) - 1
  return reach & mask == mask
end

local out = {}
for n = 1, 40 do
  if is_practical(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
