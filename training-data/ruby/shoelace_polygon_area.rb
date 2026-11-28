def area(pts)
  s = pts.zip(pts.rotate).sum { |(x1, y1), (x2, y2)| x1 * y2 - x2 * y1 }
  s.abs / 2.0
end

puts area([[0, 0], [4, 0], [4, 3], [0, 3]])
