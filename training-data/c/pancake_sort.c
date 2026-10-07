#include <stdio.h>

static void flip(int *a, int k) {
    for (int i = 0; i < k; i++, k--) {
        int t = a[i];
        a[i] = a[k];
        a[k] = t;
    }
}

/* Returns the number of flips performed. */
int pancake_sort(int *a, int n) {
    int flips = 0;
    for (int size = n; size > 1; size--) {
        int max_idx = 0;
        for (int i = 1; i < size; i++)
            if (a[i] > a[max_idx]) max_idx = i;
        if (max_idx == size - 1) continue;
        if (max_idx > 0) {
            flip(a, max_idx);
            flips++;
        }
        flip(a, size - 1);
        flips++;
    }
    return flips;
}

int main(void) {
    int a[] = {23, 10, 20, 11, 12, 6, 7};
    int n = sizeof a / sizeof a[0];
    int flips = pancake_sort(a, n);
    for (int i = 0; i < n; i++) printf("%d ", a[i]);
    printf("(%d flips)\n", flips);
    return 0;
}
