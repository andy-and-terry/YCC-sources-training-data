-- Hamming numbers (5-smooth): only prime factors 2, 3 and 5
local function is_hamming(n)
  for _, p in ipairs({2, 3, 5}) do
    while n % p == 0 do n = n // p end
  end
  return n == 1
end

local found, n = {}, 1
while #found < 20 do
  if is_hamming(n) then found[#found + 1] = n end
  n = n + 1
end
print(table.concat(found, " "))
