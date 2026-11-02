struct Vec
  getter x : Int32, y : Int32
  def initialize(@x, @y); end
  def +(o : Vec) = Vec.new(x + o.x, y + o.y)
end

puts (Vec.new(1, 2) + Vec.new(3, 4)).x
