# Palindromic primes below 200; expect 10.
isprime(n) = n > 1 && all(d -> n % d != 0, 2:isqrt(n))
found = [n for n in 2:199 if string(n) == reverse(string(n)) && isprime(n)]
println(join(found, " "))
println(length(found))
