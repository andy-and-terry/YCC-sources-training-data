#include <stdio.h>

struct P { int x, y; };

static int dist2(struct P a) { return a.x * a.x + a.y * a.y; }
static int sum(const int *v, int n) { int s = 0; while (n--) s += *v++; return s; }

int main(void) {
    printf("%d\n", dist2((struct P){ 3, 4 }));
    printf("%d\n", sum((int[]){ 1, 2, 3, 4 }, 4));
    return 0;
}
