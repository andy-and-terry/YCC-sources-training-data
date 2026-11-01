-- Positive n expressible as a*a + b*b with a, b >= 0.
local function representable(n)
  local a = 0
  while a * a <= n do
    local b = math.floor(math.sqrt(n - a * a) + 0.5)
    if a * a + b * b == n then return true end
    a = a + 1
  end
  return false
end

local out = {}
for n = 1, 30 do
  if representable(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
