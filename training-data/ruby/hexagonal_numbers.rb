# Hexagonal numbers: n(2n-1).
puts (1..10).map { |n| n * (2 * n - 1) }.join(" ")
