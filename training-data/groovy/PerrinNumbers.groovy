// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
def p = [3, 0, 2]
(3..<15).each { n -> p << p[n - 2] + p[n - 3] }
println p.join(' ')
