-- Shoelace polygon area.
local function area(pts)
  local s = 0
  for i, p in ipairs(pts) do
    local q = pts[i % #pts + 1]
    s = s + p[1] * q[2] - q[1] * p[2]
  end
  return math.abs(s) / 2
end
print(area({{0, 0}, {4, 0}, {4, 3}, {0, 3}}))
