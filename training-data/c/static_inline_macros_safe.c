#include <stdio.h>

#define SQUARE(x) ((x) * (x))
#define MAX(a, b) ({ __typeof__(a) _a = (a); __typeof__(b) _b = (b); _a > _b ? _a : _b; })

int main(void) {
    int i = 3;
    printf("%d %d\n", SQUARE(i + 1), MAX(i, 10));
    return 0;
}
