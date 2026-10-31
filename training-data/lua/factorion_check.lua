local fact = {[0] = 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880}

local function is_factorion(n)
  local sum, m = 0, n
  while m > 0 do
    sum = sum + fact[m % 10]
    m = m // 10
  end
  return sum == n
end

local found = {}
for n = 1, 49999 do
  if is_factorion(n) then found[#found + 1] = n end
end
print(table.concat(found, " "))
