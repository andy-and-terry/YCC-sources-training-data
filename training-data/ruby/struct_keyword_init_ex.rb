Point = Struct.new(:x, :y, keyword_init: true) do
  def dist = Math.sqrt(x**2 + y**2)
end

pt = Point.new(x: 3, y: 4)
puts pt.dist
p pt.to_h
case pt
in {x:, y:} then puts "x=#{x} y=#{y}"
end
