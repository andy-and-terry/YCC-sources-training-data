Point = Struct.new(:x, :y) do
  include Comparable

  def distance
    Math.sqrt(x**2 + y**2)
  end

  def <=>(other)
    distance <=> other.distance
  end
end

points = [Point.new(3, 4), Point.new(1, 1), Point.new(0, 5)]
puts points.sort.map(&:distance).inspect
