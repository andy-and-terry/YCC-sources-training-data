# Stepping through ranges with step, exclusive ends, and reverse iteration.
(0..10).step(3) { |i| print i, " " }
puts

(0...10).step(5) { |i| print i, " " }
puts

10.step(to: 0, by: -4) { |i| print i, " " }
puts

puts (1..5).reverse_each.to_a.inspect
puts ('a'..'e').to_a.join(",")
puts (1.0..2.0).step(0.5).to_a.inspect
