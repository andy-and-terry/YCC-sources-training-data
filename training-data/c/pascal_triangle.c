#include <stdio.h>

#define ROWS 7

int main(void) {
    int tri[ROWS][ROWS] = {{0}};

    for (int i = 0; i < ROWS; i++) {
        tri[i][0] = 1;
        for (int j = 1; j <= i; j++) {
            tri[i][j] = tri[i - 1][j - 1] + tri[i - 1][j];
        }
    }

    for (int i = 0; i < ROWS; i++) {
        for (int k = 0; k < (ROWS - i - 1) * 2; k++) putchar(' ');
        for (int j = 0; j <= i; j++) printf("%4d", tri[i][j]);
        putchar('\n');
    }
    return 0;
}
