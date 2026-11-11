# Repunits: numbers made only of the digit 1.
r = 0_i64
out = [] of Int64
5.times do
  r = r * 10 + 1
  out << r
end
puts out
