-- Primorials up to 1e6, including 1; expect 8.
local function is_prime(n)
  if n < 2 then return false end
  for d = 2, math.floor(math.sqrt(n)) do if n % d == 0 then return false end end
  return true
end
local values, acc, p = {1}, 1, 2
while true do
  if is_prime(p) then
    acc = acc * p
    if acc > 1000000 then break end
    values[#values + 1] = acc
  end
  p = p + 1
end
print(#values, table.concat(values, " "))
