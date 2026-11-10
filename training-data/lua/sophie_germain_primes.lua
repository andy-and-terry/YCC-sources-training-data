local function is_prime(n)
  if n < 2 then return false end
  for i = 2, math.floor(math.sqrt(n)) do
    if n % i == 0 then return false end
  end
  return true
end

local found, p = {}, 2
while #found < 10 do
  if is_prime(p) and is_prime(2 * p + 1) then found[#found + 1] = p end
  p = p + 1
end
print(table.concat(found, " ")) -- 2 3 5 11 23 29 41 53 83 89
