module Geometry
  PI_ISH = 3.14

  class Circle
    def initialize(r) = @r = r
    def area = PI_ISH * @r**2
  end

  module Util
    def self.double(x) = x * 2
  end
end

puts Geometry::Circle.new(2).area
puts Geometry::Util.double(4)
puts Geometry.constants.sort.inspect
puts Geometry.const_get(:PI_ISH)
puts Geometry::Circle.name
puts defined?(Geometry::Nope).inspect

module Geometry
  E_ISH = 2.7 # reopening adds to the namespace
end
puts Geometry::E_ISH

begin
  Geometry::Missing
rescue NameError => e
  puts e.message
end
puts ::String.name
