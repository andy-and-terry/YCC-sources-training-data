#include <stdio.h>

int add(int a, int b) { return a + b; }
int subtract(int a, int b) { return a - b; }

int apply(int (*op)(int, int), int a, int b) {
    return op(a, b);
}

int main(void) {
    printf("%d\n", apply(add, 3, 4));
    printf("%d\n", apply(subtract, 10, 3));
    return 0;
}
