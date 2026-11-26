-- Sexy primes below 100; expect 16 pairs.
local function is_prime(n)
  if n < 2 then return false end
  for d = 2, math.floor(math.sqrt(n)) do if n % d == 0 then return false end end
  return true
end
local c = 0
for p = 2, 99 do if is_prime(p) and is_prime(p + 6) then c = c + 1 end end
print(c)
