macro make_getters(*names)
  {% for n in names %}
    def {{n.id}}; @{{n.id}}; end
  {% end %}
end
class P
  def initialize(@a : Int32, @b : Int32); end
  make_getters a, b
end
puts P.new(1, 2).b
