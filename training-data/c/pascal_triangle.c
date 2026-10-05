#include <stdio.h>

#define ROWS 8

int main(void) {
    int tri[ROWS][ROWS] = {{0}};
    for (int i = 0; i < ROWS; i++) {
        tri[i][0] = 1;
        for (int j = 1; j <= i; j++)
            tri[i][j] = tri[i - 1][j - 1] + (j < i ? tri[i - 1][j] : 0);
    }
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j <= i; j++)
            printf("%d ", tri[i][j]);
        printf("\n");
    }
    return 0;
}
