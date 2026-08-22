class Circle
  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius**2
  end
end

class Square
  def initialize(side)
    @side = side
  end

  def area
    @side**2
  end
end

def shape_factory(kind, param)
  case kind
  when :circle then Circle.new(param)
  when :square then Square.new(param)
  else raise ArgumentError, "unknown shape: #{kind}"
  end
end

puts shape_factory(:circle, 2).area
puts shape_factory(:square, 3).area
