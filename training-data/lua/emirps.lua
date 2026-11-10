local function is_prime(n)
  if n < 2 then return false end
  for i = 2, math.floor(math.sqrt(n)) do
    if n % i == 0 then return false end
  end
  return true
end

local out, n = {}, 2
while #out < 10 do
  local r = tonumber(tostring(n):reverse())
  if r ~= n and is_prime(n) and is_prime(r) then out[#out + 1] = n end
  n = n + 1
end
print(table.concat(out, " ")) -- 13 17 31 37 71 73 79 97 107 113
