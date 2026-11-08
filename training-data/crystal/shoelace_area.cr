def area(pts : Array({Float64, Float64})) : Float64
  s = 0.0
  pts.each_with_index do |(x1, y1), i|
    x2, y2 = pts[(i + 1) % pts.size]
    s += x1 * y2 - x2 * y1
  end
  s.abs / 2
end

puts area([{0.0, 0.0}, {4.0, 0.0}, {4.0, 3.0}, {0.0, 3.0}])
