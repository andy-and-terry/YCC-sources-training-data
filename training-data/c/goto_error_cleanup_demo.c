#include <stdio.h>
#include <stdlib.h>

int process(int fail_at) {
    int *a = NULL;
    int *b = NULL;
    int status = 0;

    a = malloc(sizeof(int));
    if (!a || fail_at == 1) {
        status = -1;
        goto cleanup;
    }
    *a = 10;

    b = malloc(sizeof(int));
    if (!b || fail_at == 2) {
        status = -2;
        goto cleanup;
    }
    *b = 20;

    printf("sum = %d\n", *a + *b);

cleanup:
    free(a);
    free(b);
    return status;
}

int main(void) {
    printf("status = %d\n", process(0));
    printf("status = %d\n", process(1));
    printf("status = %d\n", process(2));
    return 0;
}
