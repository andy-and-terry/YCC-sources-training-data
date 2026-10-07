#include <stdio.h>

#define ROWS 8

int main(void) {
    int row[ROWS] = {1};
    for (int r = 0; r < ROWS; r++) {
        for (int c = r; c > 0; c--) row[c] += row[c - 1];  /* update right-to-left */
        for (int c = 0; c <= r; c++) printf("%d ", row[c]);
        printf("\n");
    }
    return 0;
}
