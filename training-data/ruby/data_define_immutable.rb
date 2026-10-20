Point = Data.define(:x, :y) do
  def dist = Math.sqrt(x**2 + y**2)
end

p1 = Point.new(x: 3, y: 4)
p2 = p1.with(y: 0)
puts p1.dist, p2.inspect
begin
  p1.instance_variable_set(:@x, 1)
rescue => e
  puts e.class
end
