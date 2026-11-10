isprime_simple(n) = n >= 2 && all(d -> n % d != 0, 2:isqrt(n))

function emirps(count)
    out, n = Int[], 2
    while length(out) < count
        r = parse(Int, reverse(string(n)))
        r != n && isprime_simple(n) && isprime_simple(r) && push!(out, n)
        n += 1
    end
    out
end

println(emirps(10)) # [13, 17, 31, 37, 71, 73, 79, 97, 107, 113]
