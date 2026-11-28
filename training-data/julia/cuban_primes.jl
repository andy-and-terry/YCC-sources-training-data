isprime_(n) = n >= 2 && all(n % i != 0 for i in 2:isqrt(n))

function cuban(count)
    out = Int[]
    y = 1
    while length(out) < count
        p = 3y^2 + 3y + 1
        isprime_(p) && push!(out, p)
        y += 1
    end
    return out
end

println(cuban(8))
