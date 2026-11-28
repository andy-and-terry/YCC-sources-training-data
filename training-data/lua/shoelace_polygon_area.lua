local function area(p)
  local s = 0
  for i = 1, #p do
    local a, b = p[i], p[i % #p + 1]
    s = s + a[1] * b[2] - b[1] * a[2]
  end
  return math.abs(s) / 2
end

print(area({ { 0, 0 }, { 4, 0 }, { 4, 3 }, { 0, 3 } }))
