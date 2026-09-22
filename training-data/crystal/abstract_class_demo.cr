abstract class Shape
  abstract def area : Float64

  def describe : String
    "area: #{area}"
  end
end

class Circle < Shape
  def initialize(@radius : Float64)
  end

  def area : Float64
    3.14159 * @radius * @radius
  end
end

class Rectangle < Shape
  def initialize(@width : Float64, @height : Float64)
  end

  def area : Float64
    @width * @height
  end
end

shapes = [Circle.new(2.0), Rectangle.new(3.0, 4.0)] of Shape
shapes.each { |s| puts s.describe }
