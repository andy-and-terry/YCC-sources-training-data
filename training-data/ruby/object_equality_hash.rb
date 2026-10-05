class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    other.is_a?(Point) && x == other.x && y == other.y
  end
  alias eql? ==

  def hash
    [x, y].hash
  end

  def to_s = "(#{x}, #{y})"
end

a = Point.new(1, 2)
b = Point.new(1, 2)
puts a == b, a.equal?(b)
h = { a => "first" }
puts h[b]
puts [a, b, Point.new(3, 4)].uniq.map(&:to_s).join(" ")
puts ([a] & [b]).size
