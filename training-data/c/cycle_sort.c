#include <stdio.h>

static int position(const int *a, int n, int item, int start) {
    int pos = start;
    for (int i = start + 1; i < n; i++)
        if (a[i] < item) pos++;
    return pos;
}

/* Sorts with the minimum number of memory writes; returns the write count. */
int cycle_sort(int *a, int n) {
    int writes = 0;
    for (int start = 0; start < n - 1; start++) {
        int item = a[start];
        int pos = position(a, n, item, start);
        if (pos == start) continue;
        while (item == a[pos]) pos++;
        int t = a[pos]; a[pos] = item; item = t;
        writes++;
        while (pos != start) {
            pos = position(a, n, item, start);
            while (item == a[pos]) pos++;
            t = a[pos]; a[pos] = item; item = t;
            writes++;
        }
    }
    return writes;
}

int main(void) {
    int a[] = {1, 8, 3, 9, 10, 10, 2, 4};
    int n = sizeof a / sizeof a[0];
    int w = cycle_sort(a, n);
    for (int i = 0; i < n; i++) printf("%d ", a[i]);
    printf("writes=%d\n", w);
    return 0;
}
