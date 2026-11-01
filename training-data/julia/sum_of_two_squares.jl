# Positive n expressible as a*a + b*b with a, b >= 0.
function representable(n)
    for a in 0:isqrt(n)
        b = isqrt(n - a * a)
        a * a + b * b == n && return true
    end
    return false
end

println(join(filter(representable, 1:30), " "))
