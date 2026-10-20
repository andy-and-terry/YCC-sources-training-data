class Vec
  attr_reader :x, :y
  def initialize(x, y) = (@x, @y = x, y)
  def +(o) = Vec.new(x + o.x, y + o.y)
  def -@ = Vec.new(-x, -y)
  def *(k) = Vec.new(x * k, y * k)
  def [](i) = i.zero? ? x : y
  def coerce(n) = [Vec.new(n, n), self]
  def to_s = "(#{x}, #{y})"
  def ==(o) = o.is_a?(Vec) && x == o.x && y == o.y
end

v = Vec.new(1, 2)
puts v + v, -v, v * 3, v[1], v == Vec.new(1, 2)
