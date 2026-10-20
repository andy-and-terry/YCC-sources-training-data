#include <stdio.h>

static int add(int a, int b) { return a + b; }
static int sub(int a, int b) { return a - b; }
static int mul(int a, int b) { return a * b; }

int main(void) {
    int (*ops[])(int, int) = {add, sub, mul};
    const char *names[] = {"add", "sub", "mul"};
    for (int i = 0; i < 3; i++)
        printf("%s(8,3)=%d\n", names[i], ops[i](8, 3));
    return 0;
}
