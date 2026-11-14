struct Point
  getter x : Int32, y : Int32
  def initialize(@x, @y); end
  def +(o : Point) = Point.new(x + o.x, y + o.y)
end

p = Point.new(1, 2) + Point.new(3, 4)
puts "#{p.x},#{p.y}"
