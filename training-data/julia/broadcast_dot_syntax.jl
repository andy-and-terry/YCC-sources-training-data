x = [1, 2, 3]
println(x .^ 2 .+ 1)
println(sqrt.(x))
println(map(v -> v * 2, x))
