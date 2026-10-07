#include <stdio.h>

static void swap(int *a, int *b) {
    int t = *a;
    *a = *b;
    *b = t;
}

/* Partitions a into [< pivot][== pivot][> pivot]; returns bounds via lt/gt. */
void partition3(int *a, int n, int pivot, int *lt, int *gt) {
    int lo = 0, mid = 0, hi = n - 1;
    while (mid <= hi) {
        if (a[mid] < pivot) swap(&a[lo++], &a[mid++]);
        else if (a[mid] > pivot) swap(&a[mid], &a[hi--]);
        else mid++;
    }
    *lt = lo;
    *gt = hi;
}

int main(void) {
    int a[] = {2, 0, 2, 1, 1, 0, 1, 2, 0};
    int lt, gt;
    partition3(a, 9, 1, &lt, &gt);
    for (int i = 0; i < 9; i++) printf("%d ", a[i]);
    printf("(equal range %d..%d)\n", lt, gt);
    return 0;
}
