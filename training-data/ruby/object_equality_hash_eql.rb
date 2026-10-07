class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def ==(other)
    other.is_a?(Point) && x == other.x && y == other.y
  end
  alias eql? ==

  def hash
    [x, y].hash
  end
end

a = Point.new(1, 2)
b = Point.new(1, 2)
puts a == b, a.equal?(b), a.eql?(b)

h = { a => "first" }
puts h[b]
puts [a, b, Point.new(3, 4)].uniq.size
puts (Set.new([a]) | Set.new([b])).size
