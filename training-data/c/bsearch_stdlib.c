#include <stdio.h>
#include <stdlib.h>

static int cmp(const void *a, const void *b) { return *(const int *)a - *(const int *)b; }

int main(void) {
    int a[] = {1, 3, 5, 7, 9, 11};
    int key = 7;
    int *p = bsearch(&key, a, 6, sizeof a[0], cmp);
    if (p) printf("found at %ld\n", (long)(p - a));
    return 0;
}
