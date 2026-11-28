def escape(c)
  z = Complex(0, 0)
  30.times { |n| return n if z.abs > 2; z = z * z + c }
  30
end

(-5..5).each do |yi|
  puts (-40..12).map { |xi| escape(Complex(xi / 20.0, yi / 5.0)) == 30 ? "#" : "." }.join
end
