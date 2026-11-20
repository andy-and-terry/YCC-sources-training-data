-- Goldbach pair.
local function is_prime(n)
  if n < 2 then return false end
  for d = 2, math.floor(math.sqrt(n)) do if n % d == 0 then return false end end
  return true
end
local function goldbach(n)
  for p = 2, n // 2 do if is_prime(p) and is_prime(n - p) then return p, n - p end end
end
print(goldbach(28))
