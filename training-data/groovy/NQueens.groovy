def isSafe(queens, col) {
    for (int i = 0; i < queens.size(); i++) {
        int dist = queens.size() - i
        if (queens[i] == col || Math.abs(queens[i] - col) == dist) return false
    }
    return true
}

def solve(queens, n) {
    if (queens.size() == n) return 1
    int count = 0
    for (int col = 0; col < n; col++) {
        if (isSafe(queens, col)) {
            count += solve(queens + [col], n)
        }
    }
    return count
}

println solve([], 6)
