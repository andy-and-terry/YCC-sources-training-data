struct Pt
  property x : Int32
  def initialize(@x : Int32); end
end

a = Pt.new(1)
b = a
b.x = 99
puts a.x
puts b.x
