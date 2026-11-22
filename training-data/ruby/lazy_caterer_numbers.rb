# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
puts (0...10).map { |n| n * (n + 1) / 2 + 1 }.join(" ")
