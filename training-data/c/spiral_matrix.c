#include <stdio.h>

#define N 4
#define M 5

int main(void) {
    int m[N][M];
    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; j++) m[i][j] = i * M + j + 1;

    int top = 0, bottom = N - 1, left = 0, right = M - 1;
    while (top <= bottom && left <= right) {
        for (int j = left; j <= right; j++) printf("%d ", m[top][j]);
        top++;
        for (int i = top; i <= bottom; i++) printf("%d ", m[i][right]);
        right--;
        if (top <= bottom) {
            for (int j = right; j >= left; j--) printf("%d ", m[bottom][j]);
            bottom--;
        }
        if (left <= right) {
            for (int i = bottom; i >= top; i--) printf("%d ", m[i][left]);
            left++;
        }
    }
    printf("\n");
    return 0;
}
