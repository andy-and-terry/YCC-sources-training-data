def nums = [5, 3, 8, 1]
println nums.sort()
println nums.collect { it * 2 }
println nums.findAll { it > 3 }
println nums.inject(0) { acc, n -> acc + n }
println nums.groupBy { it % 2 == 0 ? 'even' : 'odd' }
