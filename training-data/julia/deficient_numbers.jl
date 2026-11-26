# Deficient numbers below 100; expect 76.
proper_sum(n) = sum(d for d in 1:n-1 if n % d == 0; init = 0)
println(count(n -> proper_sum(n) < n, 1:99))
