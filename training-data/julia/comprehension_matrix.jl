m = [i * j for i in 1:4, j in 1:4]
display(m)
println()
println(sum(diag for diag in [m[i, i] for i in 1:4]))
println([x^2 for x in 1:10 if iseven(x)])
