def xs = [1, 2, 3, 4, 5, 6]
println xs.findAll { it % 2 == 0 }
println xs*.multiply(10)
println xs.collect { it * it }.sum()
println xs.groupBy { it % 3 }
