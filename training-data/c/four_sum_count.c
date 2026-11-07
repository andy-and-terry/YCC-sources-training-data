#include <stdio.h>
#include <stdlib.h>

/* Small-input version: count tuples (i,j,k,l) with a[i]+b[j]+c[k]+d[l] == 0
   by sorting pair sums and walking two pointers over the sorted arrays. */
static int cmp(const void *x, const void *y) { return *(const int *)x - *(const int *)y; }

static int four_sum_count(const int *a, const int *b, const int *c, const int *d, int n) {
    int ab[64], cd[64], m = 0, count = 0;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) { ab[m] = a[i] + b[j]; cd[m] = -(c[i] + d[j]); m++; }
    qsort(ab, m, sizeof(int), cmp);
    qsort(cd, m, sizeof(int), cmp);
    int i = 0, j = 0;
    while (i < m && j < m) {
        if (ab[i] < cd[j]) i++;
        else if (ab[i] > cd[j]) j++;
        else {
            int v = ab[i], ci = 0, cj = 0;
            while (i < m && ab[i] == v) { ci++; i++; }
            while (j < m && cd[j] == v) { cj++; j++; }
            count += ci * cj;
        }
    }
    return count;
}

int main(void) {
    int a[] = {1, 2}, b[] = {-2, -1}, c[] = {-1, 2}, d[] = {0, 2};
    printf("%d\n", four_sum_count(a, b, c, d, 2)); /* 2 */
    return 0;
}
