# Cantor pairing function and its inverse.
def pair(x, y)
  (x + y) * (x + y + 1) / 2 + y
end

def unpair(z)
  w = (Integer.sqrt(8 * z + 1) - 1) / 2
  y = z - w * (w + 1) / 2
  [w - y, y]
end

puts pair(3, 4)
puts unpair(32).join(" ")
