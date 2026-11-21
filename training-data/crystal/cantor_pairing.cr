# Cantor pairing function and its inverse.
def pair(x : Int64, y : Int64) : Int64
  (x + y) * (x + y + 1) // 2 + y
end

def unpair(z : Int64) : {Int64, Int64}
  w = ((Math.sqrt(8 * z + 1) - 1) // 2).to_i64
  y = z - w * (w + 1) // 2
  {w - y, y}
end

puts pair(3_i64, 4_i64)
x, y = unpair(32_i64)
puts "#{x} #{y}"
