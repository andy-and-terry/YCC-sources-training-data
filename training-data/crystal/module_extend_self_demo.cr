module Geometry
  extend self

  PI_APPROX = 3.14159

  def circle_area(r : Float64) : Float64
    PI_APPROX * r * r
  end

  def rect_area(w, h)
    w * h
  end
end

puts Geometry.circle_area(2.0)
puts Geometry.rect_area(3, 4)

module Greeter
  def self.hello(name)
    "Hello, #{name}"
  end
end

puts Greeter.hello("Crystal")
