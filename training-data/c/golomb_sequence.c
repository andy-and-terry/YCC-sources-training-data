#include <stdio.h>

#define COUNT 20

/* a(n) = 1 + a(n - a(a(n-1))), 1-based indexing */
int main(void) {
    int a[COUNT + 1] = {0, 1};
    for (int n = 2; n <= COUNT; n++)
        a[n] = 1 + a[n - a[a[n - 1]]];
    for (int n = 1; n <= COUNT; n++) printf("%d ", a[n]);
    printf("\n");
    return 0;
}
