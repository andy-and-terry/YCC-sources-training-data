#include <setjmp.h>
#include <stdio.h>

static jmp_buf env;

static void risky(int n) {
    if (n > 2) longjmp(env, n);
    printf("risky(%d) ok\n", n);
}

int main(void) {
    int code = setjmp(env);
    if (code == 0) {
        for (int i = 1; i <= 5; i++) risky(i);
    } else {
        printf("recovered from error code %d\n", code);
    }
    return 0;
}
