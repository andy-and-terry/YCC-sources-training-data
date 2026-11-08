local function shoelace(p)
  local s = 0
  for i = 1, #p do
    local q = p[i % #p + 1]
    s = s + p[i][1] * q[2] - q[1] * p[i][2]
  end
  return math.abs(s) / 2
end

print(shoelace({{0, 0}, {4, 0}, {4, 3}, {0, 3}}))
