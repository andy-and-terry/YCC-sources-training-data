#include <stdio.h>
#include <stdlib.h>
#include <stdalign.h>

struct Arena { unsigned char *base; size_t cap, off; };

static void *arena_alloc(struct Arena *a, size_t n, size_t align) {
    size_t p = (a->off + align - 1) & ~(align - 1);
    if (p + n > a->cap) return NULL;
    a->off = p + n;
    return a->base + p;
}

int main(void) {
    struct Arena a = { malloc(256), 256, 0 };
    char *c = arena_alloc(&a, 1, 1);
    double *d = arena_alloc(&a, sizeof(double), alignof(double));
    *c = 'x'; *d = 2.5;
    printf("%c %.1f off=%zu\n", *c, *d, a.off);
    free(a.base);
    return 0;
}
