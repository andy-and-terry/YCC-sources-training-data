#include <stdio.h>
#include <stdlib.h>

static int cmp(const void *a, const void *b) { return *(const int *)a - *(const int *)b; }

static void backtrack(const int *c, int n, int start, int remaining, int *path, int depth) {
    if (remaining == 0) {
        printf("[");
        for (int i = 0; i < depth; i++) printf("%s%d", i ? ", " : "", path[i]);
        printf("] ");
        return;
    }
    for (int i = start; i < n && c[i] <= remaining; i++) {
        path[depth] = c[i];
        backtrack(c, n, i, remaining - c[i], path, depth + 1);
    }
}

void combination_sum(int *c, int n, int target) {
    int path[64];
    qsort(c, (size_t)n, sizeof *c, cmp);
    backtrack(c, n, 0, target, path, 0);
    printf("\n");
}

int main(void) {
    int a[] = {2, 3, 6, 7}, b[] = {2, 3, 5};
    combination_sum(a, 4, 7);
    combination_sum(b, 3, 8);
    return 0;
}
