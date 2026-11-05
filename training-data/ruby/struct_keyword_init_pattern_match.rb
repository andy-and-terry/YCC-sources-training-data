Point = Struct.new(:x, :y, keyword_init: true)
pt = Point.new(x: 1, y: 2)
case pt
in { x:, y: } if x < y
  puts "x=#{x} below y=#{y}"
end
case { name: "ann", roles: [:admin, :dev] }
in { name: String => n, roles: [*, :admin, *] }
  puts "#{n} is admin"
end
