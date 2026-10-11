abstract class Shape
  abstract def area : Float64
  abstract def name : String

  def describe
    "#{name} with area #{area.round(2)}"
  end
end

class Circle < Shape
  def initialize(@r : Float64)
  end

  def area : Float64
    Math::PI * @r ** 2
  end

  def name : String
    "circle"
  end
end

class Square < Shape
  def initialize(@side : Float64)
  end

  def area : Float64
    @side * @side
  end

  def name : String
    "square"
  end
end

[Circle.new(1.5), Square.new(2.0)].each { |s| puts s.describe }
