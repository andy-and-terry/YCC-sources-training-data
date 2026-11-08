function minmax(xs)
    return minimum(xs), maximum(xs)
end

lo, hi = minmax([3, 1, 4, 1, 5, 9])
println("$lo $hi")
nt = (name = "x", val = 3)
println(nt.name, " ", nt[:val])
