# Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
puts (0...10).map { |n| (n**3 + 5 * n + 6) / 6 }.join(" ")
