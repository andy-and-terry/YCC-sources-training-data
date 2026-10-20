# Struct with keyword_init, plus pattern matching on struct and hash.
Point = Struct.new(:x, :y, keyword_init: true) do
  def distance_from_origin = Math.hypot(x, y)
end

p1 = Point.new(x: 3, y: 4)
puts p1.distance_from_origin
puts p1.to_h

def where(point)
  case point
  in {x: 0, y: 0} then "origin"
  in {x:, y: 0} then "on x-axis at #{x}"
  in Point[x:, y:] then "at #{x},#{y}"
  end
end

puts where(Point.new(x: 0, y: 0)), where(Point.new(x: 5, y: 0)), where(p1)
