#include <stdio.h>
#include <stddef.h>

static unsigned char pool[256];
static size_t used = 0;

static void *pool_alloc(size_t n) {
    n = (n + 7) & ~(size_t)7;
    if (used + n > sizeof pool) return NULL;
    void *p = pool + used;
    used += n;
    return p;
}

int main(void) {
    int *a = pool_alloc(sizeof *a);
    double *d = pool_alloc(sizeof *d);
    *a = 5; *d = 2.5;
    printf("%d %.1f used=%zu\n", *a, *d, used);
    return 0;
}
