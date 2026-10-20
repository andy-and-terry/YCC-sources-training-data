struct Version
  include Comparable(Version)
  getter parts : Array(Int32)

  def initialize(s : String)
    @parts = s.split('.').map(&.to_i)
  end

  def <=>(other : Version)
    @parts <=> other.parts
  end

  def to_s(io)
    io << @parts.join('.')
  end
end

vs = %w(1.10.0 1.2.0 1.2.10).map { |s| Version.new(s) }
puts vs.sort.join(" "), vs.max, Version.new("1.0") < Version.new("1.1"), Version.new("2.0").between?(vs.min, vs.max)

struct Vec
  getter x : Float64
  getter y : Float64

  def initialize(@x, @y); end

  def +(o : Vec) = Vec.new(x + o.x, y + o.y)
  def -(o : Vec) = Vec.new(x - o.x, y - o.y)
  def *(k : Number) = Vec.new(x * k, y * k)
  def -; Vec.new(-x, -y); end
  def [](i : Int32) = i == 0 ? x : y
  def ==(o : Vec) = x == o.x && y == o.y
  def to_s(io); io << "(#{x}, #{y})"; end
end

v = Vec.new(1, 2)
puts v + v, v * 3, -v, v[1], v == Vec.new(1, 2)
