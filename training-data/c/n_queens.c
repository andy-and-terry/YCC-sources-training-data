#include <stdio.h>

#define N 6

int columns[N];
int solution_count = 0;

int is_safe(int row, int col) {
    for (int prev_row = 0; prev_row < row; prev_row++) {
        int prev_col = columns[prev_row];
        if (prev_col == col) return 0;
        if (prev_row - prev_col == row - col) return 0;
        if (prev_row + prev_col == row + col) return 0;
    }
    return 1;
}

void print_solution(void) {
    for (int row = 0; row < N; row++) {
        for (int col = 0; col < N; col++) {
            putchar(columns[row] == col ? 'Q' : '.');
        }
        putchar('\n');
    }
    printf("\n");
}

void solve(int row) {
    if (row == N) {
        solution_count++;
        if (solution_count == 1) print_solution();
        return;
    }
    for (int col = 0; col < N; col++) {
        if (is_safe(row, col)) {
            columns[row] = col;
            solve(row + 1);
        }
    }
}

int main(void) {
    solve(0);
    printf("total solutions for %d-queens: %d\n", N, solution_count);
    return 0;
}
