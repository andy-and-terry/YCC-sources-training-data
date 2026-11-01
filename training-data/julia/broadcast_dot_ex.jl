xs = [1, 2, 3, 4]
println(xs .^ 2)
println(sin.(xs) .|> round)
println(xs .+ [10, 20, 30, 40])
println(@. xs * 2 + 1)
println(map(x -> x > 2, xs))
