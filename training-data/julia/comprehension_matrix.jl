m = [i * j for i in 1:3, j in 1:3]
println(m)
println([x^2 for x in 1:10 if iseven(x)])
