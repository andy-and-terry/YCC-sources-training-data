Point = Struct.new(:x, :y) do
  def dist = Math.sqrt(x**2 + y**2)
end
p Point.new(3, 4).dist

Coord = Data.define(:lat, :lng)
c = Coord.new(lat: 1, lng: 2)
p c, c.with(lat: 5)
