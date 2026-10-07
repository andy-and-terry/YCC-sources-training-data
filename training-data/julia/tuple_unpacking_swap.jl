t = (1, "two", 3.0)
a, b, c = t
println(a, " ", b, " ", c)

a, b = b, a
println(a, " ", b)

first, rest... = [1, 2, 3, 4]
println(first, " ", rest)

function minmax(xs)
    return minimum(xs), maximum(xs)
end
lo, hi = minmax([4, 9, 2])
println(lo, " ", hi)

(x, y), z = (1, 2), 3
println(x + y + z)

for (i, ch) in enumerate("abc")
    print(i, ch, " ")
end
println()
println(Tuple(1:3), " ", length(t), " ", t[end])
