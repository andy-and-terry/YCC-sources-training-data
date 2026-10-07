#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

/* Safe string-to-long conversion: returns 0 on success. */
static int parse_long(const char *s, long *out) {
    char *end;
    errno = 0;
    long v = strtol(s, &end, 10);
    if (end == s || *end != '\0') return -1;   /* no digits / trailing junk */
    if (errno == ERANGE) return -2;            /* overflow */
    *out = v;
    return 0;
}

int main(void) {
    const char *inputs[] = {"42", "-17", "12abc", "", "99999999999999999999"};
    for (int i = 0; i < 5; i++) {
        long v;
        int rc = parse_long(inputs[i], &v);
        if (rc == 0) printf("\"%s\" -> %ld\n", inputs[i], v);
        else printf("\"%s\" -> error %d\n", inputs[i], rc);
    }
    return 0;
}
