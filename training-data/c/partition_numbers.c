#include <stdio.h>

long partitions(int n) {
    long ways[64] = {1};
    for (int part = 1; part <= n; part++)
        for (int t = part; t <= n; t++)
            ways[t] += ways[t - part];
    return ways[n];
}

int main(void) {
    for (int i = 0; i < 10; i++) printf("%ld ", partitions(i));
    printf("\n");
    return 0;
}
