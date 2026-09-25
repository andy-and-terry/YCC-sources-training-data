#include <stdio.h>

#define R 3
#define C 3

int main(void) {
    int m[R][C] = {{9, 8, 7}, {5, 3, 2}, {6, 6, 7}};
    int col_min[C];
    for (int c = 0; c < C; c++) {
        col_min[c] = m[0][c];
        for (int r = 1; r < R; r++) if (m[r][c] < col_min[c]) col_min[c] = m[r][c];
    }
    for (int r = 0; r < R; r++) {
        int row_max = m[r][0];
        for (int c = 1; c < C; c++) if (m[r][c] > row_max) row_max = m[r][c];
        for (int c = 0; c < C; c++)
            if (m[r][c] == row_max && m[r][c] == col_min[c]) printf("saddle at (%d,%d)\n", r, c);
    }
    return 0;
}
