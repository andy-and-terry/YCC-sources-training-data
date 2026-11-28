def escape(cr : Float64, ci : Float64) : Int32
  zr = zi = 0.0
  30.times do |n|
    return n if zr * zr + zi * zi >= 4
    zr, zi = zr * zr - zi * zi + cr, 2 * zr * zi + ci
  end
  30
end

(-5..5).each do |yi|
  puts (-40..12).map { |xi| escape(xi / 20.0, yi / 5.0) == 30 ? '#' : '.' }.join
end
