struct Point
  getter x : Int32
  getter y : Int32

  def initialize(@x : Int32, @y : Int32)
  end

  def +(other : Point)
    Point.new(x + other.x, y + other.y)
  end
end

a = Point.new(1, 2)
b = a          # structs are copied, not shared
c = a + Point.new(10, 20)
puts a.x, b.x
puts "#{c.x},#{c.y}"
