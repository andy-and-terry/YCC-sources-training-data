#include <stdio.h>

#define N 12
#define BS 4

int main(void) {
    int a[N] = {5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5};
    int blk[N / BS] = {0};
    for (int i = 0; i < N; i++) blk[i / BS] += a[i];
    int l = 2, r = 9, sum = 0;
    for (int i = l; i <= r;) {
        if (i % BS == 0 && i + BS - 1 <= r) { sum += blk[i / BS]; i += BS; }
        else { sum += a[i]; i++; }
    }
    printf("sum[%d..%d] = %d\n", l, r, sum);
    return 0;
}
