sigma(n) = sum(d for d in 1:n if n % d == 0)

println([n for n in 1:99 if sigma(sigma(n)) == 2n]) # [2, 4, 16, 64]
