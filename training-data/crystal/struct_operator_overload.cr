struct Vector2D
  getter x : Float64
  getter y : Float64

  def initialize(@x : Float64, @y : Float64)
  end

  def +(other : Vector2D) : Vector2D
    Vector2D.new(x + other.x, y + other.y)
  end

  def to_s(io)
    io << "(#{x}, #{y})"
  end
end

v1 = Vector2D.new(1.0, 2.0)
v2 = Vector2D.new(3.0, 4.0)
puts v1 + v2
