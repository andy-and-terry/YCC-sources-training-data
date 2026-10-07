puts (1..10).step(3).to_a.inspect
puts 10.downto(7).to_a.inspect
puts 1.step(by: 4, to: 17).to_a.inspect
puts (1...5).to_a.inspect
puts (1..5).includes?(5)
puts (1...5).includes?(5)
puts ('a'..'e').to_a.join
puts (1..100).sum
puts (1..5).reduce { |acc, n| acc * n }
puts (0.0..1.0).step(0.25).to_a.inspect
puts (1..).first(3).inspect
