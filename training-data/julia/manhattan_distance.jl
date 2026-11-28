manhattan(a, b) = sum(abs.(a .- b))

println(manhattan([1, 2], [4, 6]))
