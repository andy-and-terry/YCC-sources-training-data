#include <stdio.h>

#define N 8

long stirling2(int n, int k) {
    long t[N][N] = {{0}};
    t[0][0] = 1;
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= k && j <= i; j++)
            t[i][j] = j * t[i - 1][j] + t[i - 1][j - 1];
    return t[n][k];
}

int main(void) {
    printf("%ld %ld\n", stirling2(5, 2), stirling2(6, 3));
    return 0;
}
