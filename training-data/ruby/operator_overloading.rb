class Vector2
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(other)
    Vector2.new(x + other.x, y + other.y)
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def to_s
    "(#{x}, #{y})"
  end
end

a = Vector2.new(1, 2)
b = Vector2.new(3, 4)
puts (a + b).to_s
puts a == Vector2.new(1, 2)
