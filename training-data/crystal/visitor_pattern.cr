abstract class Shape
  abstract def accept(visitor : Visitor)
end

class Circle < Shape
  getter radius : Float64

  def initialize(@radius : Float64)
  end

  def accept(visitor : Visitor)
    visitor.visit_circle(self)
  end
end

class Square < Shape
  getter side : Float64

  def initialize(@side : Float64)
  end

  def accept(visitor : Visitor)
    visitor.visit_square(self)
  end
end

abstract class Visitor
  abstract def visit_circle(circle : Circle) : Float64
  abstract def visit_square(square : Square) : Float64
end

class AreaVisitor < Visitor
  def visit_circle(circle : Circle) : Float64
    Math::PI * circle.radius ** 2
  end

  def visit_square(square : Square) : Float64
    square.side ** 2
  end
end

shapes = [Circle.new(2.0), Square.new(3.0)] of Shape
visitor = AreaVisitor.new
shapes.each { |s| puts s.accept(visitor).round(2) }
