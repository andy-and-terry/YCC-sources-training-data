# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
n = 5
println(join([binomial(n - 1, k - 1) * factorial(n) ÷ factorial(k) for k in 1:n], " "))
