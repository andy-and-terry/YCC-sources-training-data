sigma(n) = sum(d for d in 1:n if n % d == 0)

println([n for n in 1:20 if sigma(n) < 2n])
