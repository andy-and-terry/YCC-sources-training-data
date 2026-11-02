#include <stdio.h>

#define CAP 4
struct Ring { int d[CAP]; int h, t, n; };

static int put(struct Ring *r, int v) {
    if (r->n == CAP) return 0;
    r->d[r->t] = v; r->t = (r->t + 1) % CAP; r->n++;
    return 1;
}
static int get(struct Ring *r, int *v) {
    if (!r->n) return 0;
    *v = r->d[r->h]; r->h = (r->h + 1) % CAP; r->n--;
    return 1;
}

int main(void) {
    struct Ring r = {0};
    for (int i = 0; i < 6; i++) if (!put(&r, i)) printf("full at %d\n", i);
    int v;
    while (get(&r, &v)) printf("%d ", v);
    putchar('\n');
    return 0;
}
