local function is_prime(n)
  if n < 2 then return false end
  for i = 2, math.floor(math.sqrt(n)) do
    if n % i == 0 then return false end
  end
  return true
end

local out = {}
for p = 2, 99 do
  local r = tonumber(tostring(p):reverse())
  if r ~= p and is_prime(p) and is_prime(r) then out[#out + 1] = p end
end
print(table.concat(out, " "))
