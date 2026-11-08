#include <stdio.h>

typedef int (*op_fn)(int, int);

static int add(int a, int b) { return a + b; }
static int sub(int a, int b) { return a - b; }
static int mul(int a, int b) { return a * b; }

struct entry { char sym; op_fn fn; };

int main(void) {
    struct entry table[] = {{'+', add}, {'-', sub}, {'*', mul}};
    for (size_t i = 0; i < sizeof table / sizeof table[0]; i++)
        printf("8 %c 3 = %d\n", table[i].sym, table[i].fn(8, 3));
    return 0;
}
