#include <stdio.h>
#include <setjmp.h>

jmp_buf recovery_point;

void risky_operation(int fail) {
    if (fail) {
        printf("risky_operation: jumping back\n");
        longjmp(recovery_point, 1);
    }
    printf("risky_operation: completed normally\n");
}

int main(void) {
    int result = setjmp(recovery_point);
    if (result == 0) {
        printf("main: calling risky_operation\n");
        risky_operation(1);
        printf("main: this line is skipped\n");
    } else {
        printf("main: recovered with code %d\n", result);
    }
    return 0;
}
