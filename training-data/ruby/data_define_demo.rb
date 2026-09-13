Point = Data.define(:x, :y) do
  def distance_to(other)
    Math.sqrt((x - other.x)**2 + (y - other.y)**2)
  end
end

p1 = Point.new(x: 0, y: 0)
p2 = Point.new(x: 3, y: 4)
puts p1.distance_to(p2)

p3 = p2.with(y: 0)
puts p3.inspect
puts p2 == Point.new(x: 3, y: 4)
