# Goldbach pair.
isprime_(n) = n > 1 && all(d -> n % d != 0, 2:isqrt(n))
function goldbach(n)
    for p in 2:n÷2
        isprime_(p) && isprime_(n - p) && return (p, n - p)
    end
    nothing
end
println(goldbach(28))
