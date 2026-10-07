record Point3D, x : Float64, y : Float64, z : Float64 do
  def length : Float64
    Math.sqrt(x**2 + y**2 + z**2)
  end
end

record Money, cents : Int32 do
  def to_s(io)
    io << "$" << (cents / 100.0)
  end
end

p1 = Point3D.new(1.0, 2.0, 2.0)
puts p1.length
puts p1

m1 = Money.new(1050)
m2 = Money.new(250)
puts m1 == Money.new(1050)
puts m1
puts m2
