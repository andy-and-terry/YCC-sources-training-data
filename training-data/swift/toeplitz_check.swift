func isToeplitz(_ m: [[Int]]) -> Bool {
    for i in 1..<max(m.count, 1) {
        for j in 1..<max(m[i].count, 1) where m[i][j] != m[i - 1][j - 1] {
            return false
        }
    }
    return true
}

print(isToeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]]))
print(isToeplitz([[1, 2], [2, 2]]))
