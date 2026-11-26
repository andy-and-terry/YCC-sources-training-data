# Emirps below 200; expect 15.
isprime(n) = n > 1 && all(d -> n % d != 0, 2:isqrt(n))

rev(n) = parse(Int, reverse(string(n)))
found = [n for n in 2:199 if rev(n) != n && isprime(n) && isprime(rev(n))]
println(length(found), " ", found)
