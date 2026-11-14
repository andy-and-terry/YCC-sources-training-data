#include <stdio.h>

static int add(int a, int b) { return a + b; }
static int sub(int a, int b) { return a - b; }
static int mul(int a, int b) { return a * b; }

int main(void) {
    struct { char op; int (*fn)(int, int); } table[] = {
        {'+', add}, {'-', sub}, {'*', mul},
    };
    for (size_t i = 0; i < sizeof table / sizeof *table; i++)
        printf("%c -> %d\n", table[i].op, table[i].fn(6, 3));
    return 0;
}
