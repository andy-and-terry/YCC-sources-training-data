isprime_simple(n) = n >= 2 && all(d -> n % d != 0, 2:isqrt(n))

pairs = [(p, p + 2) for p in 3:78 if isprime_simple(p) && isprime_simple(p + 2)]
println(pairs) # [(3, 5), (5, 7), (11, 13), (17, 19), (29, 31), (41, 43), (59, 61), (71, 73)]
