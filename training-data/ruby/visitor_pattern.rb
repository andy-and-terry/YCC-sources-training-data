class Circle
  attr_reader :radius

  def initialize(radius)
    @radius = radius
  end

  def accept(visitor)
    visitor.visit_circle(self)
  end
end

class Rectangle
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def accept(visitor)
    visitor.visit_rectangle(self)
  end
end

class AreaVisitor
  def visit_circle(circle)
    Math::PI * circle.radius**2
  end

  def visit_rectangle(rect)
    rect.width * rect.height
  end
end

class DescribeVisitor
  def visit_circle(circle)
    "circle with radius #{circle.radius}"
  end

  def visit_rectangle(rect)
    "rectangle #{rect.width}x#{rect.height}"
  end
end

shapes = [Circle.new(3), Rectangle.new(4, 5)]
area_visitor = AreaVisitor.new
describe_visitor = DescribeVisitor.new

shapes.each do |shape|
  puts shape.accept(describe_visitor)
  puts shape.accept(area_visitor).round(2)
end
