function ispronic(x::Int)
    n = isqrt(x)
    return n * (n + 1) == x
end

println([n * (n + 1) for n in 0:9]) # [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
println((ispronic(56), ispronic(57))) # (true, false)
