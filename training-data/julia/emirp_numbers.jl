# Emirps: primes whose digit reversal is a different prime.
function isprime_naive(n)
    n < 2 && return false
    for i in 2:isqrt(n)
        n % i == 0 && return false
    end
    return true
end

rev(n) = parse(Int, reverse(string(n)))

emirps = [n for n in 2:99 if rev(n) != n && isprime_naive(n) && isprime_naive(rev(n))]
println(emirps)
