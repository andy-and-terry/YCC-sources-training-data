# Exact decimal arithmetic for money with BigDecimal.
require "bigdecimal"
require "bigdecimal/util"

puts 0.1 + 0.2 == 0.3
puts BigDecimal("0.1") + BigDecimal("0.2") == BigDecimal("0.3")

price = BigDecimal("19.99")
quantity = 3
subtotal = price * quantity
tax = (subtotal * BigDecimal("0.0825")).round(2, BigDecimal::ROUND_HALF_UP)
total = subtotal + tax

puts "subtotal: #{subtotal.to_s('F')}"
puts "tax:      #{tax.to_s('F')}"
puts "total:    #{total.to_s('F')}"

split = (total / 4).round(2)
puts "each of 4: #{split.to_s('F')}"
puts "remainder: #{(total - split * 4).to_s('F')}"

puts "12.50".to_d.class
puts 3.to_d + "0.5".to_d
puts format("%.2f", total)
