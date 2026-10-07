#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Arbitrary-precision decimal strings: add and multiply, returning malloc'd results. */
char *big_add(const char *a, const char *b) {
    size_t la = strlen(a), lb = strlen(b), n = (la > lb ? la : lb) + 1;
    char *r = malloc(n + 1);
    r[n] = '\0';
    int carry = 0;
    for (size_t k = 0; k < n; k++) {
        int s = carry;
        if (k < la) s += a[la - 1 - k] - '0';
        if (k < lb) s += b[lb - 1 - k] - '0';
        r[n - 1 - k] = (char)('0' + s % 10);
        carry = s / 10;
    }
    if (r[0] == '0' && n > 1) memmove(r, r + 1, n);
    return r;
}

char *big_mul(const char *a, const char *b) {
    size_t la = strlen(a), lb = strlen(b), n = la + lb;
    int *d = calloc(n, sizeof *d);
    for (size_t i = la; i-- > 0;)
        for (size_t j = lb; j-- > 0;) {
            int p = (a[i] - '0') * (b[j] - '0') + d[i + j + 1];
            d[i + j + 1] = p % 10;
            d[i + j] += p / 10;
        }
    char *r = malloc(n + 1);
    size_t k = 0, i = 0;
    while (i + 1 < n && d[i] == 0) i++;
    for (; i < n; i++) r[k++] = (char)('0' + d[i]);
    r[k] = '\0';
    free(d);
    return r;
}

int main(void) {
    char *s = big_add("99999999999999999999", "1");
    printf("%s\n", s);
    free(s);
    char *f = malloc(2);
    strcpy(f, "1");
    for (int i = 2; i <= 50; i++) {
        char num[8];
        snprintf(num, sizeof num, "%d", i);
        char *next = big_mul(f, num);
        free(f);
        f = next;
    }
    printf("50! = %s\n", f);
    free(f);
    return 0;
}
