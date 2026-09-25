#include <stdio.h>

#define N 4

void spiral(int g[N][N]) {
    int top = 0, left = 0, bottom = N - 1, right = N - 1, k = 1;
    while (top <= bottom && left <= right) {
        for (int c = left; c <= right; c++) g[top][c] = k++;
        top++;
        for (int r = top; r <= bottom; r++) g[r][right] = k++;
        right--;
        if (top <= bottom) { for (int c = right; c >= left; c--) g[bottom][c] = k++; bottom--; }
        if (left <= right) { for (int r = bottom; r >= top; r--) g[r][left] = k++; left++; }
    }
}

int main(void) {
    int g[N][N] = {0};
    spiral(g);
    for (int r = 0; r < N; r++) {
        for (int c = 0; c < N; c++) printf("%3d", g[r][c]);
        putchar('\n');
    }
    return 0;
}
