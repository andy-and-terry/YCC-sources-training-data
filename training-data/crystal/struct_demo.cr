struct Point
  getter x : Int32
  getter y : Int32

  def initialize(@x : Int32, @y : Int32)
  end

  def +(other : Point) : Point
    Point.new(@x + other.x, @y + other.y)
  end

  def to_s(io)
    io << "(#{@x}, #{@y})"
  end
end

p1 = Point.new(1, 2)
p2 = Point.new(3, 4)
puts p1 + p2
