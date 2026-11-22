# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
isprime_td(n) = n >= 2 && all(n % d != 0 for d in 2:isqrt(n))

println(join([p for p in 2:99 if isprime_td(p) && isprime_td(p + 2)], " "))
