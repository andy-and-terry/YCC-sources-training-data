func solveNQueens(_ n: Int) -> Int {
    var cols = [Int](repeating: -1, count: n)
    var count = 0

    func isSafe(_ row: Int, _ col: Int) -> Bool {
        for r in 0..<row {
            let c = cols[r]
            if c == col || abs(c - col) == abs(r - row) { return false }
        }
        return true
    }

    func backtrack(_ row: Int) {
        if row == n {
            count += 1
            return
        }
        for col in 0..<n where isSafe(row, col) {
            cols[row] = col
            backtrack(row + 1)
        }
    }

    backtrack(0)
    return count
}

print(solveNQueens(6))
