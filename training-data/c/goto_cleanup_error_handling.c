#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* The classic "goto cleanup" idiom: acquire resources in order, and on any
 * failure jump to labels that release them in reverse order. */
static int process(size_t n, int fail_at) {
    int status = -1;
    char *buffer = NULL;
    int *numbers = NULL;
    FILE *out = NULL;

    buffer = malloc(n);
    if (buffer == NULL || fail_at == 1) goto done;

    numbers = calloc(n, sizeof *numbers);
    if (numbers == NULL || fail_at == 2) goto free_buffer;

    out = tmpfile();
    if (out == NULL || fail_at == 3) goto free_numbers;

    memset(buffer, 'x', n);
    for (size_t i = 0; i < n; i++) numbers[i] = (int)i * 2;
    fprintf(out, "%.*s %d\n", (int)n, buffer, numbers[n - 1]);
    status = 0;

    fclose(out);
free_numbers:
    free(numbers);
free_buffer:
    free(buffer);
done:
    return status;
}

int main(void) {
    for (int fail_at = 0; fail_at <= 3; fail_at++)
        printf("fail_at=%d -> status %d\n", fail_at, process(4, fail_at));
    return 0;
}
