def secant(x0, x1, tol: 1e-12, limit: 50, &f)
  limit.times do
    f0 = f.call(x0)
    f1 = f.call(x1)
    break if f1 == f0
    x0, x1 = x1, x1 - f1 * (x1 - x0) / (f1 - f0)
    break if (x1 - x0).abs < tol
  end
  x1
end

puts secant(1.0, 2.0) { |x| x * x - 2 }
