# Centered square numbers: n^2 + (n+1)^2.
puts (0...10).map { |n| n * n + (n + 1) * (n + 1) }.join(" ")
