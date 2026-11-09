#include <stdio.h>

int main(void) {
    int a[6] = { [1] = 10, [4] = 40 };
    struct { int x, y; } p = { .y = 2, .x = 1 };
    for (int i = 0; i < 6; i++) printf("%d ", a[i]);
    printf("| %d %d\n", p.x, p.y);
    return 0;
}
