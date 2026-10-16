require "big"

a = BigDecimal.new("0.1")
b = BigDecimal.new("0.2")
puts a + b
puts (a + b) == BigDecimal.new("0.3")
puts 0.1 + 0.2 == 0.3

price = BigDecimal.new("19.99")
qty = BigDecimal.new(3)
total = price * qty
puts total
puts total.round(1)
puts (BigDecimal.new(1) / BigDecimal.new(3)).round(5)
puts total.to_f
