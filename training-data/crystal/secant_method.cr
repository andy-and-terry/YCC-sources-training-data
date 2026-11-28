def secant(x0 : Float64, x1 : Float64, &f : Float64 -> Float64) : Float64
  50.times do
    f0 = f.call(x0)
    f1 = f.call(x1)
    break if f1 == f0
    x0, x1 = x1, x1 - f1 * (x1 - x0) / (f1 - f0)
    break if (x1 - x0).abs < 1e-12
  end
  x1
end

puts secant(1.0, 2.0) { |x| x * x - 2 }
