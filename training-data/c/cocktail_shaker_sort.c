#include <stdbool.h>
#include <stdio.h>

static void swap(int *a, int *b) {
    int t = *a;
    *a = *b;
    *b = t;
}

void cocktail_shaker_sort(int *a, int n) {
    int lo = 0, hi = n - 1;
    bool swapped = true;
    while (swapped) {
        swapped = false;
        for (int i = lo; i < hi; i++) {
            if (a[i] > a[i + 1]) {
                swap(&a[i], &a[i + 1]);
                swapped = true;
            }
        }
        hi--;
        for (int i = hi; i > lo; i--) {
            if (a[i - 1] > a[i]) {
                swap(&a[i - 1], &a[i]);
                swapped = true;
            }
        }
        lo++;
    }
}

int main(void) {
    int a[] = {5, 1, 4, 2, 8, 0, 2};
    int n = sizeof a / sizeof a[0];
    cocktail_shaker_sort(a, n);
    for (int i = 0; i < n; i++) printf("%d ", a[i]);
    printf("\n");
    return 0;
}
