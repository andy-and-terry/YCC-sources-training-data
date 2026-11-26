-- Palindromic primes below 200; expect 10.
local function is_prime(n)
  if n < 2 then return false end
  for d = 2, math.floor(math.sqrt(n)) do if n % d == 0 then return false end end
  return true
end
local found = {}
for n = 2, 199 do
  local s = tostring(n)
  if s == s:reverse() and is_prime(n) then found[#found + 1] = n end
end
print(table.concat(found, " "))
print(#found)
