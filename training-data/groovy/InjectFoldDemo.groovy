def nums = [1, 2, 3, 4, 5]
println nums.inject { a, b -> a * b }
println nums.inject(100) { acc, n -> acc - n }
println nums.sum()
println nums.sum { it * it }
println nums.inject([:]) { m, n -> m[n] = n * n; m }
println nums.collectMany { [it, -it] }
println nums.findResult { it > 3 ? it * 10 : null }
println nums.count { it % 2 == 0 }
println nums.min()
println nums.max { -it }
println nums.split { it > 2 }
