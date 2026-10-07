#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

/* Parse a whole string as a base-10 int; return 1 on success. */
static int parse_int_strict(const char *s, int *out) {
    char *end;
    errno = 0;
    long v = strtol(s, &end, 10);

    if (end == s) return 0;                       /* no digits */
    while (isspace((unsigned char)*end)) end++;   /* allow trailing space */
    if (*end != '\0') return 0;                   /* trailing junk */
    if (errno == ERANGE || v > INT_MAX || v < INT_MIN) return 0;

    *out = (int)v;
    return 1;
}

int main(void) {
    const char *tests[] = {"123", "-45", "  7  ", "12x", "", "2147483648", "0x1F"};
    for (size_t i = 0; i < sizeof tests / sizeof tests[0]; i++) {
        int v;
        if (parse_int_strict(tests[i], &v))
            printf("\"%s\" -> %d\n", tests[i], v);
        else
            printf("\"%s\" -> invalid\n", tests[i]);
    }

    /* base 0 auto-detects 0x and leading 0 */
    printf("%ld %ld %ld\n", strtol("0x1F", NULL, 0), strtol("017", NULL, 0), strtol("17", NULL, 0));
    printf("%ld\n", strtol("zz", NULL, 36));
    return 0;
}
