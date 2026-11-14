function minmax(xs)
    return minimum(xs), maximum(xs)
end

lo, hi = minmax([3, 9, 1, 7])
println("$lo..$hi")
