-- Emirps below 200; expect 15.
local function is_prime(n)
  if n < 2 then return false end
  for d = 2, math.floor(math.sqrt(n)) do if n % d == 0 then return false end end
  return true
end
local found = {}
for n = 2, 199 do
  local r = tonumber(tostring(n):reverse())
  if r ~= n and is_prime(n) and is_prime(r) then found[#found + 1] = n end
end
print(#found, table.concat(found, " "))
