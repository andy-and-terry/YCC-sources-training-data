struct Pt
  property x : Int32
  def initialize(@x); end
end
a = Pt.new(1); b = a; b.x = 9
puts a.x, b.x
