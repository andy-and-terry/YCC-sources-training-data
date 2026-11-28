local function secant(f, x0, x1)
  for _ = 1, 50 do
    local f0, f1 = f(x0), f(x1)
    if f1 == f0 then break end
    x0, x1 = x1, x1 - f1 * (x1 - x0) / (f1 - f0)
    if math.abs(x1 - x0) < 1e-12 then break end
  end
  return x1
end

print(string.format("%.10f", secant(function(x) return x * x - 2 end, 1, 2)))
