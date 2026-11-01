struct Point
  getter x : Int32
  getter y : Int32

  def initialize(@x : Int32, @y : Int32); end

  def +(o : Point) = Point.new(x + o.x, y + o.y)
  def to_s(io) : Nil
    io << "(" << x << ", " << y << ")"
  end
end

puts Point.new(1, 2) + Point.new(3, 4)
