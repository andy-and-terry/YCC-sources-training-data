Point = Struct.new(:x, :y) do
  def dist = Math.hypot(x, y)
end

pt = Point.new(3, 4)
x, y = *pt
puts x, y, pt.dist
puts pt.to_a.inspect, pt.to_h.inspect, pt.members.inspect
puts pt == Point.new(3, 4), pt.eql?(Point.new(3, 4))
pt.x += 1
puts pt.inspect
puts pt.each.to_a.inspect, pt.values_at(1, 0).inspect

case pt
in [a, b] then puts "array pattern #{a},#{b}"
end
case pt
in { x:, y: } then puts "hash pattern #{x},#{y}"
end
puts Point.new(1).inspect
begin
  Point.new(1, 2, 3)
rescue ArgumentError => e
  puts e.message
end
