local function chebyshev(a, b)
  local m = 0
  for i = 1, #a do m = math.max(m, math.abs(a[i] - b[i])) end
  return m
end

print(chebyshev({1, 2}, {4, 6}))
