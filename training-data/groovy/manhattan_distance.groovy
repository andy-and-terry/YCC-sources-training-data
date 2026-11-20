// Manhattan distance using transpose.
def manhattan(a, b) { [a, b].transpose().sum { (it[0] - it[1]).abs() } }
println manhattan([1, 2], [4, 6])
