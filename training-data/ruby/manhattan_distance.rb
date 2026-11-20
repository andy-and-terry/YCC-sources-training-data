# Manhattan distance with zip.
def manhattan(a, b) = a.zip(b).sum { |x, y| (x - y).abs }
puts manhattan([1, 2], [4, 6])
