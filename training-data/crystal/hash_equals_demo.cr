class Point
  getter x : Int32
  getter y : Int32

  def initialize(@x, @y)
  end

  def_equals_and_hash @x, @y
end

a = Point.new(1, 2)
b = Point.new(1, 2)
c = Point.new(2, 1)

puts a == b
puts a == c
puts a.hash == b.hash

seen = Set(Point).new
seen << a << b << c
puts seen.size

visits = Hash(Point, Int32).new(0)
[a, b, c, a].each { |p| visits[p] += 1 }
puts visits[Point.new(1, 2)]
