# Shoelace polygon area.
def area(pts)
  sum = pts.each_with_index.sum do |(x1, y1), i|
    x2, y2 = pts[(i + 1) % pts.size]
    x1 * y2 - x2 * y1
  end
  sum.abs / 2.0
end
puts area([[0, 0], [4, 0], [4, 3], [0, 3]])
