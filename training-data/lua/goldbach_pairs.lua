-- Goldbach partitions of 100; expect 6.
local function is_prime(n)
  if n < 2 then return false end
  for d = 2, math.floor(math.sqrt(n)) do if n % d == 0 then return false end end
  return true
end
local pairs_found = {}
for p = 2, 50 do
  if is_prime(p) and is_prime(100 - p) then pairs_found[#pairs_found + 1] = p .. "+" .. (100 - p) end
end
print(#pairs_found, table.concat(pairs_found, " "))
