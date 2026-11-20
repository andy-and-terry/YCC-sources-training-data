# Twin primes below 50 using Primes-free sieve.
function twins(limit)
    s = trues(limit + 2)
    s[1] = false
    for i in 2:isqrt(limit + 2), j in i*i:i:limit+2
        s[j] = false
    end
    [(p, p + 2) for p in 2:limit if s[p] && s[p + 2]]
end
println(twins(50))
