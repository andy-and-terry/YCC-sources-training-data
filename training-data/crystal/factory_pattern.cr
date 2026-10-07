abstract class ShapeBase
  abstract def area : Float64
end

class CircleShape < ShapeBase
  def initialize(@radius : Float64)
  end

  def area : Float64
    Math::PI * @radius ** 2
  end
end

class SquareShape < ShapeBase
  def initialize(@side : Float64)
  end

  def area : Float64
    @side ** 2
  end
end

def shape_factory(kind : String, param : Float64) : ShapeBase
  case kind
  when "circle"
    CircleShape.new(param)
  when "square"
    SquareShape.new(param)
  else
    raise ArgumentError.new("unknown shape: #{kind}")
  end
end

puts shape_factory("circle", 2.0).area
puts shape_factory("square", 3.0).area
