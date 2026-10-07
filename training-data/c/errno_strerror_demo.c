#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

static int parse_int(const char *s, long *out) {
    char *end;
    errno = 0;
    long v = strtol(s, &end, 10);
    if (errno == ERANGE) return ERANGE;
    if (end == s || *end != '\0') return EINVAL;
    *out = v;
    return 0;
}

int main(void) {
    FILE *f = fopen("/nonexistent/file.txt", "r");
    if (!f) {
        printf("fopen failed: errno=%d (%s)\n", errno, strerror(errno));
        perror("perror says");
    }

    const char *inputs[] = {"42", "12abc", "", "99999999999999999999"};
    for (size_t i = 0; i < sizeof inputs / sizeof inputs[0]; i++) {
        long v;
        int rc = parse_int(inputs[i], &v);
        if (rc == 0)
            printf("'%s' -> %ld\n", inputs[i], v);
        else
            printf("'%s' -> error: %s\n", inputs[i], strerror(rc));
    }

    errno = 0;
    double r = strtod("1e999", NULL);
    printf("strtod overflow: errno=%s result=%f\n",
           errno == ERANGE ? "ERANGE" : "none", r);
    return 0;
}
