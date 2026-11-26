# Twin primes below 100; expect 8.
isprime(n) = n > 1 && all(d -> n % d != 0, 2:isqrt(n))

println(count(p -> isprime(p) && isprime(p + 2), 2:99))
