#include <stdio.h>

/* Merges b into a, where a has capacity m + n and holds m sorted items. */
void merge_into(int *a, int m, const int *b, int n) {
    int i = m - 1, j = n - 1, k = m + n - 1;
    while (j >= 0) a[k--] = (i >= 0 && a[i] > b[j]) ? a[i--] : b[j--];
}

int main(void) {
    int a[8] = {1, 4, 7, 10};
    int b[] = {2, 3, 8, 9};
    merge_into(a, 4, b, 4);
    for (int i = 0; i < 8; i++) printf("%d ", a[i]);
    printf("\n");
    return 0;
}
