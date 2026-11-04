#include <stdio.h>
#include <stdbool.h>

#define COLS 3

bool is_toeplitz(int m[][COLS], int rows) {
    for (int i = 1; i < rows; i++)
        for (int j = 1; j < COLS; j++)
            if (m[i][j] != m[i - 1][j - 1]) return false;
    return true;
}

int main(void) {
    int a[3][COLS] = {{1, 2, 3}, {4, 1, 2}, {5, 4, 1}};
    int b[2][COLS] = {{1, 2, 3}, {4, 5, 2}};
    printf("%d %d\n", is_toeplitz(a, 3), is_toeplitz(b, 2));
    return 0;
}
