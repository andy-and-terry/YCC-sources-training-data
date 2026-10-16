#include <stdio.h>

/* Compute row n of Pascal's triangle in place with a single array. */
int main(void) {
    int n = 8;
    unsigned long row[16] = {1};
    for (int i = 1; i <= n; i++)
        for (int j = i; j > 0; j--)
            row[j] += row[j - 1];
    for (int j = 0; j <= n; j++) printf("%lu ", row[j]);
    putchar('\n');
    return 0;
}
