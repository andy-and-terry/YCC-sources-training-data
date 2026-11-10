isprime_simple(n) = n >= 2 && all(d -> n % d != 0, 2:isqrt(n))

function sophie_germain(count)
    out, p = Int[], 2
    while length(out) < count
        isprime_simple(p) && isprime_simple(2p + 1) && push!(out, p)
        p += 1
    end
    out
end

println(sophie_germain(10)) # [2, 3, 5, 11, 23, 29, 41, 53, 83, 89]
