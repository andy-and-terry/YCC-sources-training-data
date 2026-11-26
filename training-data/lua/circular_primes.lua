-- Circular primes below 100; expect 13.
local function is_prime(n)
  if n < 2 then return false end
  for d = 2, math.floor(math.sqrt(n)) do if n % d == 0 then return false end end
  return true
end
local function circular(n)
  local s = tostring(n)
  for i = 0, #s - 1 do
    if not is_prime(tonumber(s:sub(i + 1) .. s:sub(1, i))) then return false end
  end
  return true
end
local c = 0
for n = 2, 99 do if circular(n) then c = c + 1 end end
print(c)
