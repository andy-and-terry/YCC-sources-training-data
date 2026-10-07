#include <stdio.h>
#include <stdlib.h>

static int cmp(const void *a, const void *b) {
    int x = *(const int *)a, y = *(const int *)b;
    return (x > y) - (x < y);
}

/* Multiset intersection of two arrays (sorted in place); returns count written to out. */
int intersect(int *a, int na, int *b, int nb, int *out) {
    qsort(a, (size_t)na, sizeof *a, cmp);
    qsort(b, (size_t)nb, sizeof *b, cmp);
    int i = 0, j = 0, k = 0;
    while (i < na && j < nb) {
        if (a[i] < b[j]) i++;
        else if (a[i] > b[j]) j++;
        else {
            out[k++] = a[i];
            i++;
            j++;
        }
    }
    return k;
}

int main(void) {
    int a[] = {4, 9, 5, 4, 4}, b[] = {9, 4, 9, 8, 4}, out[5];
    int k = intersect(a, 5, b, 5, out);
    for (int i = 0; i < k; i++) printf("%d ", out[i]);
    printf("\n");
    return 0;
}
