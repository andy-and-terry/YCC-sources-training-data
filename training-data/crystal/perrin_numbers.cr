# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
p = [3_i64, 0_i64, 2_i64]
(3...15).each { |n| p << p[n - 2] + p[n - 3] }
puts p.join(" ")
