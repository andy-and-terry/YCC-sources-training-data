#include <ctype.h>
#include <limits.h>
#include <stdio.h>

/* Parses an optional sign and decimal digits; returns 0 on success. */
int parse_int(const char *s, int *out) {
    while (isspace((unsigned char)*s)) s++;

    int sign = 1;
    if (*s == '-' || *s == '+') {
        if (*s == '-') sign = -1;
        s++;
    }
    if (!isdigit((unsigned char)*s)) return -1;

    long long value = 0;
    while (isdigit((unsigned char)*s)) {
        value = value * 10 + (*s - '0');
        if (value * sign > INT_MAX || value * sign < INT_MIN) return -2;
        s++;
    }
    if (*s != '\0') return -1;

    *out = (int)(value * sign);
    return 0;
}

int main(void) {
    const char *tests[] = {"123", "  -45", "+7", "12abc", "", "99999999999"};
    for (int i = 0; i < 6; i++) {
        int v;
        int rc = parse_int(tests[i], &v);
        if (rc == 0) printf("\"%s\" -> %d\n", tests[i], v);
        else printf("\"%s\" -> error %d\n", tests[i], rc);
    }
    return 0;
}
