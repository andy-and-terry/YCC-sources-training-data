#include <stdio.h>

#define ROWS 10

int main(void) {
    unsigned long long row[ROWS] = {1};
    for (int r = 0; r < ROWS; r++) {
        for (int i = r; i > 0; i--) row[i] += row[i - 1];
        printf("%*s", (ROWS - r - 1) * 2, "");
        for (int i = 0; i <= r; i++) printf("%4llu", row[i]);
        printf("\n");
    }
    return 0;
}
