local function is_prime(n)
  if n < 2 then return false end
  for i = 2, math.floor(math.sqrt(n)) do
    if n % i == 0 then return false end
  end
  return true
end

local out = {}
for n = 2, 199 do
  local s = tostring(n)
  if s == s:reverse() and is_prime(n) then out[#out + 1] = n end
end
print(table.concat(out, " ")) -- 2 3 5 7 11 101 131 151 181 191
