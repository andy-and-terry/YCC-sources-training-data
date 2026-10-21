# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
p = [1_i64, 1_i64, 1_i64]
(3...15).each { |i| p << p[i - 2] + p[i - 3] }
puts p.join(" ")
