using Primes

is_powerful(n) = all(e >= 2 for (_, e) in factor(n))

println(join(filter(is_powerful, 1:100), " "))
