-- Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
local function is_prime(n)
  if n < 2 then return false end
  local d = 2
  while d * d <= n do
    if n % d == 0 then return false end
    d = d + 1
  end
  return true
end

local out = {}
for p = 2, 99 do
  if is_prime(p) and is_prime(p + 2) then out[#out + 1] = p end
end
print(table.concat(out, " "))
