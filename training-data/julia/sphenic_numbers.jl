using Primes

is_sphenic(n) = collect(values(factor(n))) == [1, 1, 1]

println(filter(is_sphenic, 2:79))
