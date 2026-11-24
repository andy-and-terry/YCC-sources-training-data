# Pentagonal numbers: n(3n-1)/2.
puts (1..10).map { |n| n * (3 * n - 1) // 2 }.join(" ")
