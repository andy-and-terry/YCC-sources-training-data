A = [i * j for i in 1:3, j in 1:3]
println(A)
println(A .+ 1)
println(sum(A; dims=1))
println(sqrt.([1.0, 4.0, 9.0]))
