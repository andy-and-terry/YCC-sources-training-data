def chebyshev(a : Array(Int32), b : Array(Int32)) : Int32
  a.zip(b).max_of { |x, y| (x - y).abs }
end

puts chebyshev([1, 2], [4, 6])
