puts 12345.digits.sum
puts 255.digits(16).inspect
puts 10.pow(20, 7)
puts Integer.sqrt(99)
puts 17.gcd(51), 4.lcm(6)
puts 2**100
puts 100.downto(95).to_a.inspect
puts 1.step(20, 5).to_a.inspect
puts 10.0.floor, 3.7.ceil, -3.7.truncate, 3.5.round, 2.5.round
puts Rational(3, 4) + Rational(1, 4)
puts Complex(1, 2) * Complex(3, 4)
puts 0.1 + 0.2 == 0.3, (0.1 + 0.2 - 0.3).abs < Float::EPSILON
