#include <stdio.h>

#define N 4

void rotate_clockwise(int m[N][N]) {
    for (int i = 0; i < N; i++)
        for (int j = i + 1; j < N; j++) {
            int t = m[i][j];
            m[i][j] = m[j][i];
            m[j][i] = t;
        }
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N / 2; j++) {
            int t = m[i][j];
            m[i][j] = m[i][N - 1 - j];
            m[i][N - 1 - j] = t;
        }
}

int main(void) {
    int m[N][N];
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++) m[i][j] = i * N + j + 1;
    rotate_clockwise(m);
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) printf("%3d", m[i][j]);
        printf("\n");
    }
    return 0;
}
