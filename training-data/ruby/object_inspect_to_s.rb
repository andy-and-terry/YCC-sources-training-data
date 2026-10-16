class Point
  def initialize(x, y)
    @x, @y = x, y
  end
end

class Pretty < Point
  def to_s = "(#{@x}, #{@y})"
end

class Custom < Point
  def inspect = "#<Custom #{@x},#{@y}>"
end

puts Point.new(1, 2).inspect.sub(/0x\h+/, "0x..")
puts Pretty.new(1, 2)
puts "interp: #{Pretty.new(3, 4)}"
puts Pretty.new(1, 2).inspect.sub(/0x\h+/, "0x..")
p Custom.new(5, 6)
puts [Custom.new(7, 8)].inspect
puts nil.to_s.empty?, nil.inspect
puts :sym.inspect, "str".inspect, 1.0.inspect
