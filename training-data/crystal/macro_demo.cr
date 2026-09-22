macro define_getter(name)
  def {{name.id}}
    @{{name.id}}
  end
end

class Widget
  def initialize(@width : Int32, @height : Int32)
  end

  define_getter width
  define_getter height

  def area
    width * height
  end
end

w = Widget.new(4, 5)
puts w.width
puts w.height
puts w.area
