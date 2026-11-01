# Leyland numbers: x**y + y**x for x >= y >= 2.
vals = (2..4).flat_map { |x| (2..x).map { |y| x**y + y**x } }
puts vals.join(" ")
