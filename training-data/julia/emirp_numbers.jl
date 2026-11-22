# Emirps: primes whose digit reversal is a different prime.
isprime_td(n) = n >= 2 && all(n % d != 0 for d in 2:isqrt(n))

function isemirp(n)
    r = parse(Int, reverse(string(n)))
    return r != n && isprime_td(n) && isprime_td(r)
end

println(join(filter(isemirp, 2:199), " "))
