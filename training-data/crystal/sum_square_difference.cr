# Square of the sum minus sum of squares for 1..10 (expect 2640)
xs = (1..10).to_a
sum = xs.sum
squares = xs.sum { |x| x * x }
puts sum * sum - squares
