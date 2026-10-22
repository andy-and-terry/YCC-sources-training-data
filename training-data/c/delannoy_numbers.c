#include <stdio.h>

#define COUNT 10

int main(void) {
    long grid[COUNT][COUNT];
    for (int m = 0; m < COUNT; m++) {
        for (int n = 0; n < COUNT; n++) {
            if (m == 0 || n == 0) grid[m][n] = 1;
            else grid[m][n] = grid[m - 1][n] + grid[m][n - 1] + grid[m - 1][n - 1];
        }
    }
    for (int k = 0; k < COUNT; k++) printf("%ld ", grid[k][k]);
    printf("\n");
    return 0;
}
