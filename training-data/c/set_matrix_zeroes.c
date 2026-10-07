#include <stdbool.h>
#include <stdio.h>

#define R 3
#define C 4

void set_zeroes(int m[R][C]) {
    bool rows[R] = {false}, cols[C] = {false};
    for (int r = 0; r < R; r++)
        for (int c = 0; c < C; c++)
            if (m[r][c] == 0) rows[r] = cols[c] = true;
    for (int r = 0; r < R; r++)
        for (int c = 0; c < C; c++)
            if (rows[r] || cols[c]) m[r][c] = 0;
}

int main(void) {
    int m[R][C] = {{0, 1, 2, 0}, {3, 4, 5, 2}, {1, 3, 1, 5}};
    set_zeroes(m);
    for (int r = 0; r < R; r++) {
        for (int c = 0; c < C; c++) printf("%d ", m[r][c]);
        printf("\n");
    }
    return 0;
}
