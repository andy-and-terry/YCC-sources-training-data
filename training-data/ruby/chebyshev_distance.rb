def chebyshev(a, b)
  a.zip(b).map { |x, y| (x - y).abs }.max
end

puts chebyshev([1, 2], [4, 6])
