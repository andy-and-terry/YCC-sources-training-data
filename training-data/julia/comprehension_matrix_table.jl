table = [i * j for i in 1:4, j in 1:4]
display(table)
println(sum(table[i, i] for i in 1:4))
