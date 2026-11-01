-- Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
local function sopfr(n)
  local total, p = 0, 2
  while p * p <= n do
    while n % p == 0 do
      total = total + p
      n = n // p
    end
    p = p + 1
  end
  if n > 1 then total = total + n end
  return total
end

local out = {}
for n = 2, 109 do
  if sopfr(n) == sopfr(n + 1) then out[#out + 1] = n end
end
print(table.concat(out, " "))
