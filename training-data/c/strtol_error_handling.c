#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

static int parse_int(const char *s, int *out) {
    char *end;
    errno = 0;
    long v = strtol(s, &end, 10);
    if (errno == ERANGE || v > INT_MAX || v < INT_MIN) return -1;
    if (end == s || *end != '\0') return -2;
    *out = (int)v;
    return 0;
}

int main(void) {
    const char *inputs[] = {"123", "-45", "12abc", "", "99999999999"};
    for (int i = 0; i < 5; i++) {
        int v;
        int rc = parse_int(inputs[i], &v);
        if (rc == 0) printf("'%s' -> %d\n", inputs[i], v);
        else printf("'%s' -> error %d\n", inputs[i], rc);
    }
    return 0;
}
