local function prime_factor_count(n)
  local count, p = 0, 2
  while p * p <= n do
    while n % p == 0 do
      n = n // p
      count = count + 1
    end
    p = p + 1
  end
  if n > 1 then count = count + 1 end
  return count
end

local out = {}
for n = 2, 29 do
  if prime_factor_count(n) == 2 then out[#out + 1] = n end
end
print(table.concat(out, " "))
