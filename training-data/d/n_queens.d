import std.stdio;

int countSolutions(int n) {
    auto cols = new bool[n];
    auto diag1 = new bool[2 * n];
    auto diag2 = new bool[2 * n];
    int count = 0;

    void solve(int row) {
        if (row == n) {
            count++;
            return;
        }
        foreach (col; 0 .. n) {
            if (cols[col] || diag1[row + col] || diag2[row - col + n]) continue;
            cols[col] = diag1[row + col] = diag2[row - col + n] = true;
            solve(row + 1);
            cols[col] = diag1[row + col] = diag2[row - col + n] = false;
        }
    }

    solve(0);
    return count;
}

void main() {
    writeln(countSolutions(8));
}
