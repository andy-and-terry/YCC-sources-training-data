def manhattan(a, b)
  a.zip(b).sum { |x, y| (x - y).abs }
end

puts manhattan([1, 2], [4, 6])
