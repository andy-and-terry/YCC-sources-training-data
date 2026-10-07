macro auto_equality
  def ==(other : self) : Bool
    {% for ivar in @type.instance_vars %}
    return false unless @{{ivar.name}} == other.@{{ivar.name}}
    {% end %}
    true
  end
end

class Coordinate
  def initialize(@x : Int32, @y : Int32)
  end

  auto_equality
end

c1 = Coordinate.new(1, 2)
c2 = Coordinate.new(1, 2)
c3 = Coordinate.new(3, 4)
puts c1 == c2
puts c1 == c3
