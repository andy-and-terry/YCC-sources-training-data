#include <stdbool.h>
#include <stdio.h>

void odd_even_sort(int *a, int n) {
    bool sorted = false;
    while (!sorted) {
        sorted = true;
        for (int start = 1; start >= 0; start--) {
            for (int i = start; i + 1 < n; i += 2) {
                if (a[i] > a[i + 1]) {
                    int t = a[i];
                    a[i] = a[i + 1];
                    a[i + 1] = t;
                    sorted = false;
                }
            }
        }
    }
}

int main(void) {
    int a[] = {34, 2, 10, -9, 5, 3, 1};
    int n = sizeof a / sizeof a[0];
    odd_even_sort(a, n);
    for (int i = 0; i < n; i++) printf("%d ", a[i]);
    printf("\n");
    return 0;
}
