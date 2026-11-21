-- Cantor pairing function and its inverse.
local function pair(x, y)
  return (x + y) * (x + y + 1) // 2 + y
end

local function unpair(z)
  local w = math.floor((math.sqrt(8 * z + 1) - 1) / 2)
  local y = z - w * (w + 1) // 2
  return w - y, y
end

print(pair(3, 4))
print(unpair(32))
