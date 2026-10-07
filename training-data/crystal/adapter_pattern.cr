abstract class Shape
  abstract def area : Float64
end

class Circle < Shape
  def initialize(@radius : Float64)
  end

  def area : Float64
    Math::PI * @radius ** 2
  end
end

class LegacyRectangle
  def initialize(@width : Float64, @height : Float64)
  end

  def legacy_area : Float64
    @width * @height
  end
end

class RectangleAdapter < Shape
  def initialize(@legacy : LegacyRectangle)
  end

  def area : Float64
    @legacy.legacy_area
  end
end

shapes = [Circle.new(2.0), RectangleAdapter.new(LegacyRectangle.new(3.0, 4.0))] of Shape
shapes.each { |s| puts s.area }
