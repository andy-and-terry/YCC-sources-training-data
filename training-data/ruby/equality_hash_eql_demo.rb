# Making custom objects work as Hash keys requires eql? and hash.
class Coord
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def ==(other)
    other.is_a?(Coord) && x == other.x && y == other.y
  end
  alias eql? ==

  def hash
    [x, y].hash
  end

  def to_s = "(#{x}, #{y})"
end

a = Coord.new(1, 2)
b = Coord.new(1, 2)
puts a == b
puts a.equal?(b)
puts a.eql?(b)

visits = { a => "first" }
puts visits[b]
puts [a, b, Coord.new(3, 4)].uniq.map(&:to_s).join(" ")
puts 1 == 1.0, 1.eql?(1.0), 1.equal?(1)
