#include <stdio.h>
#include <setjmp.h>
static jmp_buf env;
static void fail(void) { longjmp(env, 7); }
int main(void) {
    int r = setjmp(env);
    if (r == 0) { fail(); puts("unreachable"); }
    else printf("recovered %d\n", r);
    return 0;
}
