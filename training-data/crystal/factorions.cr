FACT = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

result = (1...50000).select { |n| n.digits.sum { |d| FACT[d] } == n }
puts result.join(" ") # 1 2 145 40585
