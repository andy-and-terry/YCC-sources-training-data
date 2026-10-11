#include <stdio.h>

/* GNU statement expressions evaluate each argument exactly once. */
#define MAX(a, b) ({ __typeof__(a) _a = (a); __typeof__(b) _b = (b); _a > _b ? _a : _b; })
#define BAD_MAX(a, b) ((a) > (b) ? (a) : (b))

int main(void) {
    int i = 5, j = 5;
    int bad = BAD_MAX(i++, j);   /* i incremented twice when i > j */
    int x = 5, y = 3;
    int good = MAX(x++, y);
    printf("bad=%d i=%d\n", bad, i);
    printf("good=%d x=%d\n", good, x);
    return 0;
}
