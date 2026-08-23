def make_point(x : Int32, y : Int32)
  {x: x, y: y}
end

p1 = make_point(1, 2)
p2 = make_point(3, 4)
puts "(#{p1[:x] + p2[:x]}, #{p1[:y] + p2[:y]})"
