x = 3.14159

puts x.round(2)
puts x.floor
puts x.ceil
puts x.trunc
puts -2.5.round
puts 2.5.round
puts 3.5.round
puts -7.5.round(mode: :ties_away)
puts 1234.5678.round(-2)
puts x.to_i
puts 10.0 / 3
puts 10.fdiv(4)
puts (0.1 + 0.2).round(10)
puts Float64::INFINITY > 1e308
puts (0.0 / 0.0).nan?
