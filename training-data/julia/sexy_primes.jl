# Sexy primes below 100; expect 16 pairs.
isprime(n) = n > 1 && all(d -> n % d != 0, 2:isqrt(n))

println(count(p -> isprime(p) && isprime(p + 6), 2:99))
