-- Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
local function gcd(a, b)
  while b ~= 0 do a, b = b, a % b end
  return a
end

local function phi(n)
  local c = 0
  for k = 1, n do
    if gcd(k, n) == 1 then c = c + 1 end
  end
  return c
end

local function is_perfect_totient(n)
  local total, m = 0, n
  while m > 1 do
    m = phi(m)
    total = total + m
  end
  return total == n
end

local out = {}
for n = 2, 199 do
  if is_perfect_totient(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
