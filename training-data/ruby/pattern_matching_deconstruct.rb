class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def deconstruct
    [x, y]
  end

  def deconstruct_keys(keys)
    { x: x, y: y }
  end
end

def describe(point)
  case point
  in [0, 0]
    'origin'
  in [Integer => x, 0]
    "on the x-axis at #{x}"
  in { x:, y: } if x == y
    "on the diagonal at #{x}"
  in { x:, y: }
    "at (#{x}, #{y})"
  end
end

puts describe(Point.new(0, 0))
puts describe(Point.new(5, 0))
puts describe(Point.new(3, 3))
puts describe(Point.new(2, 7))

expected = 3
case [1, 3, 5]
in [*, ^expected, *]
  puts 'contains the expected value'
else
  puts 'not found'
end
