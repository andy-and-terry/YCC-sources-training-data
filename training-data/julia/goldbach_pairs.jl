isprime_(n) = n > 1 && all(n % d != 0 for d in 2:isqrt(n))

goldbach(n) = [(p, n - p) for p in 2:n÷2 if isprime_(p) && isprime_(n - p)]

println(goldbach(28))
