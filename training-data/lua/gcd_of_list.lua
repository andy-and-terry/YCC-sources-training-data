local function gcd(a, b)
  while b ~= 0 do a, b = b, a % b end
  return math.abs(a)
end

local function gcd_all(...)
  local g = 0
  for _, n in ipairs({ ... }) do g = gcd(g, n) end
  return g
end

print(gcd_all(12, 18, 24))
print(gcd_all(7, 13))
