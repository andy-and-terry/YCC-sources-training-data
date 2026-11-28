xs = [1.0, 4.0, 9.0]
println(sqrt.(xs) .+ 1)
println(@. xs^2 + 2xs)
println(map(x -> x > 2 ? "big" : "small", xs))
