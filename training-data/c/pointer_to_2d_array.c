#include <stdio.h>

#define COLS 3

void print_rows(int (*grid)[COLS], int rows) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < COLS; j++) {
            printf("%3d", grid[i][j]);
        }
        printf("\n");
    }
}

int sum_all(int rows, int cols, int m[rows][cols]) {
    int total = 0;
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            total += m[i][j];
    return total;
}

int main(void) {
    int grid[2][COLS] = {{1, 2, 3}, {4, 5, 6}};
    print_rows(grid, 2);
    printf("sum = %d\n", sum_all(2, COLS, grid));
    printf("row stride = %zu bytes\n", sizeof(grid[0]));
    return 0;
}
