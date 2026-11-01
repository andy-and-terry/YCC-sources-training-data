def nums = [5, 3, 8, 1, 9]
println nums.sort(false)
println nums.findAll { it > 4 }
println nums.sum() + " " + nums.max() + " " + nums.min()
println nums.groupBy { it % 2 == 0 ? 'even' : 'odd' }
println nums.inject(0) { acc, v -> acc + v }
println nums.collate(2)
