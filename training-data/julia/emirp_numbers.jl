using Primes

reversenum(n) = parse(Int, reverse(string(n)))

emirps = [p for p in primes(199) if reversenum(p) != p && isprime(reversenum(p))]
println(emirps) # [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
