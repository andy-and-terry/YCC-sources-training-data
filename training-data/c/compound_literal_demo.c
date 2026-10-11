#include <stdio.h>

struct Point { int x, y; };

static int manhattan(struct Point p) { return (p.x < 0 ? -p.x : p.x) + (p.y < 0 ? -p.y : p.y); }

static int sum(const int *a, int n) {
    int s = 0;
    for (int i = 0; i < n; i++) s += a[i];
    return s;
}

int main(void) {
    printf("%d\n", manhattan((struct Point){-3, 4}));
    printf("%d\n", sum((int[]){1, 2, 3, 4, 5}, 5));
    return 0;
}
