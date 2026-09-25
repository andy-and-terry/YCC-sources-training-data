#include <stdio.h>

#define R 4
#define C 4

int island_perimeter(int g[R][C]) {
    int per = 0;
    for (int r = 0; r < R; r++)
        for (int c = 0; c < C; c++) {
            if (!g[r][c]) continue;
            per += 4;
            if (r > 0 && g[r - 1][c]) per -= 2;
            if (c > 0 && g[r][c - 1]) per -= 2;
        }
    return per;
}

int main(void) {
    int g[R][C] = {{0, 1, 0, 0}, {1, 1, 1, 0}, {0, 1, 0, 0}, {1, 1, 0, 0}};
    printf("%d\n", island_perimeter(g));
    return 0;
}
