#include <stdio.h>

#define N 3

void rotate_clockwise(int m[N][N]) {
    for (int i = 0; i < N; i++)
        for (int j = i + 1; j < N; j++) { int t = m[i][j]; m[i][j] = m[j][i]; m[j][i] = t; }
    for (int i = 0; i < N; i++)
        for (int l = 0, r = N - 1; l < r; l++, r--) { int t = m[i][l]; m[i][l] = m[i][r]; m[i][r] = t; }
}

int main(void) {
    int m[N][N] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    rotate_clockwise(m);
    for (int i = 0; i < N; i++) printf("%d %d %d\n", m[i][0], m[i][1], m[i][2]);
    return 0;
}
