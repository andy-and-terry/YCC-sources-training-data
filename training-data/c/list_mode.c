#include <stdio.h>
#include <stdlib.h>

static int cmp(const void *a, const void *b) {
    return *(const int *)a - *(const int *)b;
}

int main(void) {
    int v[] = {1, 2, 2, 3, 3, 4};
    int n = sizeof v / sizeof v[0];
    qsort(v, n, sizeof v[0], cmp);
    int best = 0;
    for (int i = 0, run = 0; i < n; i++) {
        run = (i > 0 && v[i] == v[i - 1]) ? run + 1 : 1;
        if (run > best) best = run;
    }
    for (int i = 0, run = 0; i < n; i++) {
        run = (i > 0 && v[i] == v[i - 1]) ? run + 1 : 1;
        if (run == best) printf("%d ", v[i]);
    }
    printf("\n");
    return 0;
}
