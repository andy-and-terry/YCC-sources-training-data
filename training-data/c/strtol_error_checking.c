#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

static int parse_int(const char *s, long *out) {
    char *end;
    errno = 0;
    long v = strtol(s, &end, 10);
    if (errno == ERANGE || end == s || *end != '\0') return 0;
    *out = v;
    return 1;
}

int main(void) {
    const char *tests[] = { "42", "-7", "12abc", "", "99999999999999999999" };
    for (int i = 0; i < 5; i++) {
        long v;
        printf("'%s' -> %s\n", tests[i], parse_int(tests[i], &v) ? "ok" : "bad");
    }
    return 0;
}
