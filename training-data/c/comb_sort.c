#include <stdbool.h>
#include <stdio.h>

void comb_sort(int *a, int n) {
    int gap = n;
    bool sorted = false;
    while (!sorted) {
        gap = (int)(gap / 1.3);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (int i = 0; i + gap < n; i++) {
            if (a[i] > a[i + gap]) {
                int t = a[i];
                a[i] = a[i + gap];
                a[i + gap] = t;
                sorted = false;
            }
        }
    }
}

int main(void) {
    int a[] = {8, 4, 1, 56, 3, -44, 23, -6, 28, 0};
    int n = sizeof a / sizeof a[0];
    comb_sort(a, n);
    for (int i = 0; i < n; i++) printf("%d ", a[i]);
    printf("\n");
    return 0;
}
