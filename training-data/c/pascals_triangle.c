#include <stdio.h>

#define ROWS 6

int main(void) {
    long triangle[ROWS][ROWS] = {0};

    for (int r = 0; r < ROWS; r++) {
        triangle[r][0] = 1;
        triangle[r][r] = 1;
        for (int c = 1; c < r; c++) {
            triangle[r][c] = triangle[r - 1][c - 1] + triangle[r - 1][c];
        }
    }

    for (int r = 0; r < ROWS; r++) {
        for (int c = 0; c <= r; c++) {
            printf("%ld ", triangle[r][c]);
        }
        printf("\n");
    }
    return 0;
}
