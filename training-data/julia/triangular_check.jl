# n is triangular iff 8n + 1 is a perfect square.
function is_triangular(n)
    s = 8n + 1
    r = isqrt(s)
    return r * r == s
end

println(join(filter(is_triangular, 0:20), " "))
