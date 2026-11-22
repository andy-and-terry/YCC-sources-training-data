-- Emirps: primes whose digit reversal is a different prime.
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
for n = 2, 199 do
  local r = tonumber(tostring(n):reverse())
  if r ~= n and is_prime(n) and is_prime(r) then out[#out + 1] = n end
end
print(table.concat(out, " "))
