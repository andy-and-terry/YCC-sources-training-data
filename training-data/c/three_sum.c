#include <stdio.h>
#include <stdlib.h>

static int cmp(const void *a, const void *b) {
    int x = *(const int *)a, y = *(const int *)b;
    return (x > y) - (x < y);
}

void three_sum(int *a, int n, int target) {
    qsort(a, (size_t)n, sizeof *a, cmp);
    for (int i = 0; i < n - 2; i++) {
        if (i > 0 && a[i] == a[i - 1]) continue;
        int lo = i + 1, hi = n - 1;
        while (lo < hi) {
            int s = a[i] + a[lo] + a[hi];
            if (s < target) lo++;
            else if (s > target) hi--;
            else {
                printf("[%d, %d, %d] ", a[i], a[lo], a[hi]);
                while (lo < hi && a[lo] == a[lo + 1]) lo++;
                while (lo < hi && a[hi] == a[hi - 1]) hi--;
                lo++;
                hi--;
            }
        }
    }
    printf("\n");
}

int main(void) {
    int a[] = {-1, 0, 1, 2, -1, -4};
    int b[] = {1, 2, 3, 4, 5, 6};
    three_sum(a, 6, 0);
    three_sum(b, 6, 10);
    return 0;
}
