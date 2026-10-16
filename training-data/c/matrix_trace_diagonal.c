#include <stdio.h>

#define N 4

int main(void) {
    int m[N][N] = {
        { 1,  2,  3,  4},
        { 5,  6,  7,  8},
        { 9, 10, 11, 12},
        {13, 14, 15, 16}
    };
    int trace = 0, anti = 0;
    for (int i = 0; i < N; i++) {
        trace += m[i][i];
        anti += m[i][N - 1 - i];
    }
    printf("trace=%d anti-diagonal=%d\n", trace, anti);
    return 0;
}
