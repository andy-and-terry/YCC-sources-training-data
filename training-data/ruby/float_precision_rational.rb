puts 0.1 + 0.2, 0.1 + 0.2 == 0.3
puts (0.1 + 0.2 - 0.3).abs < Float::EPSILON
puts 0.1r + 0.2r == 0.3r
puts Rational(3, 6), 3.to_r / 4, 0.75.to_r, 0.1.rationalize(Rational(1, 100))
puts Rational("2/3") + Rational(1, 3)
puts 1.0 / 0, -1.0 / 0, (0.0 / 0).nan?
puts Float::MAX, Float::MIN, Float::DIG
puts 3.14159.round(2), 1234.567.round(-2), 1234.567.truncate(1)
puts 10.0.to_s, 1e20.to_s, 1e-5.to_s, 1e16.to_i
puts 7.0.floor, 7.2.ceil, -7.2.ceil, -7.5.round
begin
  1 / 0
rescue ZeroDivisionError => e
  puts e.message
end
require "bigdecimal"
puts (BigDecimal("0.1") + BigDecimal("0.2")).to_s("F")
