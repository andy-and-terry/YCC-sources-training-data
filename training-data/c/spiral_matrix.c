#include <stdio.h>

#define N 4

int main(void) {
    int m[N][N];
    int top = 0, bottom = N - 1, left = 0, right = N - 1, v = 1;
    while (top <= bottom && left <= right) {
        for (int j = left; j <= right; j++) m[top][j] = v++;
        top++;
        for (int i = top; i <= bottom; i++) m[i][right] = v++;
        right--;
        if (top <= bottom) {
            for (int j = right; j >= left; j--) m[bottom][j] = v++;
            bottom--;
        }
        if (left <= right) {
            for (int i = bottom; i >= top; i--) m[i][left] = v++;
            left++;
        }
    }
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) printf("%3d", m[i][j]);
        putchar('\n');
    }
    return 0;
}
