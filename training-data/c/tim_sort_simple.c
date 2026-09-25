#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MIN_RUN 32

static void insertion_sort(int *a, int lo, int hi) {
    for (int i = lo + 1; i <= hi; i++) {
        int key = a[i], j = i - 1;
        while (j >= lo && a[j] > key) {
            a[j + 1] = a[j];
            j--;
        }
        a[j + 1] = key;
    }
}

static void merge(int *a, int *buf, int lo, int mid, int hi) {
    memcpy(buf + lo, a + lo, (size_t)(hi - lo + 1) * sizeof *a);
    int i = lo, j = mid + 1, k = lo;
    while (i <= mid && j <= hi) a[k++] = buf[i] <= buf[j] ? buf[i++] : buf[j++];
    while (i <= mid) a[k++] = buf[i++];
    while (j <= hi) a[k++] = buf[j++];
}

void tim_sort(int *a, int n) {
    int *buf = malloc((size_t)n * sizeof *a);
    if (!buf) return;
    for (int lo = 0; lo < n; lo += MIN_RUN) insertion_sort(a, lo, lo + MIN_RUN - 1 < n - 1 ? lo + MIN_RUN - 1 : n - 1);
    for (int size = MIN_RUN; size < n; size *= 2) {
        for (int lo = 0; lo < n; lo += 2 * size) {
            int mid = lo + size - 1 < n - 1 ? lo + size - 1 : n - 1;
            int hi = lo + 2 * size - 1 < n - 1 ? lo + 2 * size - 1 : n - 1;
            if (mid < hi) merge(a, buf, lo, mid, hi);
        }
    }
    free(buf);
}

static int cmp(const void *x, const void *y) {
    return (*(const int *)x > *(const int *)y) - (*(const int *)x < *(const int *)y);
}

int main(void) {
    enum { N = 1000 };
    int a[N], b[N];
    srand(42);
    for (int i = 0; i < N; i++) a[i] = b[i] = rand() % 10000;
    tim_sort(a, N);
    qsort(b, N, sizeof b[0], cmp);
    printf("matches qsort: %s\n", memcmp(a, b, sizeof a) == 0 ? "yes" : "no");
    return 0;
}
