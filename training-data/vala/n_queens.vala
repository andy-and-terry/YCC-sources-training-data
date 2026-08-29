bool is_safe(int[] queens, int col) {
    for (int i = 0; i < queens.length; i++) {
        int dist = queens.length - i;
        if (queens[i] == col || (queens[i] - col).abs() == dist) return false;
    }
    return true;
}

int solve(int[] queens, int n) {
    if (queens.length == n) return 1;
    int count = 0;
    for (int col = 0; col < n; col++) {
        if (is_safe(queens, col)) {
            int[] newQueens = queens;
            newQueens += col;
            count += solve(newQueens, n);
        }
    }
    return count;
}

void main() {
    int[] empty = {};
    stdout.printf("%d\n", solve(empty, 6));
}
