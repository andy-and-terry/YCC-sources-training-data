using Primes

ispal(n) = (s = string(n); s == reverse(s))

println(filter(ispal, primes(199))) # [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
