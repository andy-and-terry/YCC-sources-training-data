def secant(a : Float64, b : Float64, &f : Float64 -> Float64) : Float64
  40.times do
    fa, fb = f.call(a), f.call(b)
    break if (fb - fa).abs < 1e-15
    a, b = b, b - fb * (b - a) / (fb - fa)
  end
  b
end

puts secant(1.0, 2.0) { |x| x * x - 2 }.round(8)
