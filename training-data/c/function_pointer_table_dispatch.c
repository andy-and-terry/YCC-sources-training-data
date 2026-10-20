#include <stdio.h>

typedef int (*op_fn)(int, int);
static int add(int a, int b) { return a + b; }
static int sub(int a, int b) { return a - b; }
static int mul(int a, int b) { return a * b; }

int main(void) {
    struct { const char *name; op_fn f; } ops[] = { {"add", add}, {"sub", sub}, {"mul", mul} };
    for (size_t i = 0; i < sizeof ops / sizeof ops[0]; i++)
        printf("%s(6,3)=%d\n", ops[i].name, ops[i].f(6, 3));
    return 0;
}
