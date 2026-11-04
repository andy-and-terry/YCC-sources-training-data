boolean isToeplitz(List<List<Integer>> m) {
    (1..<m.size()).every { i ->
        (1..<m[i].size()).every { j -> m[i][j] == m[i - 1][j - 1] }
    }
}

println isToeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]])
println isToeplitz([[1, 2], [2, 2]])
