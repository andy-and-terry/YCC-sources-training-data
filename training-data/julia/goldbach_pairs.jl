# Goldbach partitions of 100; expect 6.
isprime(n) = n > 1 && all(d -> n % d != 0, 2:isqrt(n))

pairs = [(p, 100 - p) for p in 2:50 if isprime(p) && isprime(100 - p)]
println(length(pairs), " ", pairs)
