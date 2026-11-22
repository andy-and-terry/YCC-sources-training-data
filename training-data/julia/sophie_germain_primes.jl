# Sophie Germain primes: p prime and 2p + 1 prime.
isprime_td(n) = n >= 2 && all(n % d != 0 for d in 2:isqrt(n))

println(join([p for p in 2:99 if isprime_td(p) && isprime_td(2p + 1)], " "))
