#include <stdio.h>

#define COUNT 20

/* Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), Q(1) = Q(2) = 1 */
int main(void) {
    int q[COUNT + 1] = {0, 1, 1};
    for (int n = 3; n <= COUNT; n++)
        q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
    for (int n = 1; n <= COUNT; n++) printf("%d ", q[n]);
    printf("\n");
    return 0;
}
