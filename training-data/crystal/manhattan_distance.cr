# Manhattan distance.
def manhattan(a : Array(Int32), b : Array(Int32)) : Int32
  a.zip(b).sum { |x, y| (x - y).abs }
end

puts manhattan([1, 2], [4, 6])
