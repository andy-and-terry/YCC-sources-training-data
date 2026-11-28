#include <setjmp.h>
#include <stdio.h>

static jmp_buf env;

static void fail(void) { longjmp(env, 1); }

int main(void) {
    if (setjmp(env) == 0) {
        puts("trying");
        fail();
    } else {
        puts("recovered");
    }
    return 0;
}
