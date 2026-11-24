# Tetrahedral numbers: n(n+1)(n+2)/6.
puts (1..10).map { |n| n * (n + 1) * (n + 2) / 6 }.join(" ")
