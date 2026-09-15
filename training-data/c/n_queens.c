#include <stdio.h>
#include <stdlib.h>

#define N 8

int is_safe(int *cols, int row, int col) {
    for (int r = 0; r < row; r++) {
        int c = cols[r];
        if (c == col || abs(c - col) == abs(r - row)) {
            return 0;
        }
    }
    return 1;
}

int solve(int *cols, int row, int n) {
    if (row == n) {
        return 1;
    }
    int count = 0;
    for (int col = 0; col < n; col++) {
        if (is_safe(cols, row, col)) {
            cols[row] = col;
            count += solve(cols, row + 1, n);
        }
    }
    return count;
}

int main(void) {
    int cols[N];
    int total = solve(cols, 0, N);
    printf("solutions for %d-queens: %d\n", N, total);
    return 0;
}
