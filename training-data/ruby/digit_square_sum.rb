def digit_square_sum(n)
  n.abs.digits.sum { |d| d * d }
end

puts digit_square_sum(123)
puts digit_square_sum(-99)
