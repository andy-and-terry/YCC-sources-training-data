#include <stdio.h>

#define N 8

int main(void) {
    int values[N] = {3, 1, 4, 1, 5, 9, 2, 6};
    long prefix[N + 1] = {0};
    for (int i = 0; i < N; i++) prefix[i + 1] = prefix[i] + values[i];
    int lo = 2, hi = 5;
    printf("sum[%d,%d) = %ld\n", lo, hi, prefix[hi] - prefix[lo]);
    return 0;
}
