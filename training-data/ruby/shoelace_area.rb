def shoelace(pts)
  s = pts.each_with_index.sum do |(x1, y1), i|
    x2, y2 = pts[(i + 1) % pts.size]
    x1 * y2 - x2 * y1
  end
  s.abs / 2.0
end

puts shoelace([[0, 0], [4, 0], [4, 3], [0, 3]])
