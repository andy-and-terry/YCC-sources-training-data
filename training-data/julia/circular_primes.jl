# Circular primes below 100; expect 13.
isprime(n) = n > 1 && all(d -> n % d != 0, 2:isqrt(n))

function circular(n)
    s = string(n)
    all(i -> isprime(parse(Int, s[i:end] * s[1:i-1])), 1:length(s))
end
println(count(circular, 2:99))
