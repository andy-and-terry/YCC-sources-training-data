def nested = [1, [2, [3, [4]]], 5]
println nested.flatten()
println [3, 1, 3, 2, 1].unique()
println [3, 1, 3, 2, 1].toUnique()
println [1, 2, 3, 4].collate(3)
println [1, 2, 3] + [4] - [2]
println ([1, 2, 3] * 2)
println [1, 2, 3, 4, 5].take(2) + [1, 2, 3, 4, 5].drop(3)
println [[1, 2], [3, 4]].transpose()
println [1, 2, 3].combinations().size()
println [1, 2, 3].subsequences().size()
println [5, 3, 8].sort(false)
println ['a', 'b', 'c'].indexed()
