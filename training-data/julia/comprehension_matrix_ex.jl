m = [i * j for i in 1:3, j in 1:4]
println(m)
println(sum(m; dims=1))
println([x for x in 1:20 if x % 3 == 0])
println(Dict(k => k^2 for k in 1:3))
