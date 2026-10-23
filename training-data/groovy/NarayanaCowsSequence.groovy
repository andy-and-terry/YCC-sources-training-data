// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
def n = [1, 1, 1]
(3..<15).each { i -> n << n[i - 1] + n[i - 3] }
println n.join(' ')
