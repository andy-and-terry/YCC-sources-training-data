#include <setjmp.h>
#include <stdio.h>

static jmp_buf env;

static void deep(int n) {
    if (n == 0) longjmp(env, 42);
    deep(n - 1);
}

int main(void) {
    int code = setjmp(env);
    if (code == 0) { printf("calling\n"); deep(5); }
    else printf("recovered with %d\n", code);
    return 0;
}
