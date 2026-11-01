-- Pernicious numbers: the popcount is prime.
local function is_prime(n)
  if n < 2 then return false end
  for d = 2, math.floor(math.sqrt(n)) do
    if n % d == 0 then return false end
  end
  return true
end

local function popcount(n)
  local c = 0
  while n > 0 do
    c = c + n % 2
    n = n // 2
  end
  return c
end

local out = {}
for n = 1, 20 do
  if is_prime(popcount(n)) then out[#out + 1] = n end
end
print(table.concat(out, " "))
