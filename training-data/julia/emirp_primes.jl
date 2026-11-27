isprime_(n) = n >= 2 && all(n % i != 0 for i in 2:isqrt(n))
rev(n) = parse(Int, reverse(string(n)))

println([p for p in 2:99 if isprime_(p) && rev(p) != p && isprime_(rev(p))])
