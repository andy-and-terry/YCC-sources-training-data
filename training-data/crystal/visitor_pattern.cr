abstract class Shape
  abstract def accept(visitor : AreaVisitor) : Float64
end

class Circle < Shape
  def initialize(@radius : Float64)
  end

  def radius : Float64
    @radius
  end

  def accept(visitor : AreaVisitor) : Float64
    visitor.visit_circle(self)
  end
end

class Square < Shape
  def initialize(@side : Float64)
  end

  def side : Float64
    @side
  end

  def accept(visitor : AreaVisitor) : Float64
    visitor.visit_square(self)
  end
end

class AreaVisitor
  def visit_circle(c : Circle) : Float64
    Math::PI * c.radius ** 2
  end

  def visit_square(s : Square) : Float64
    s.side ** 2
  end
end

shapes = [Circle.new(2.0), Square.new(3.0)] of Shape
visitor = AreaVisitor.new
shapes.each { |s| puts s.accept(visitor) }
