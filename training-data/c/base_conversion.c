#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char DIGITS[] = "0123456789abcdefghijklmnopqrstuvwxyz";

/* Writes n in the given base into buf; returns buf. */
char *to_base(long long n, int base, char *buf, size_t cap) {
    char tmp[72];
    int k = 0, neg = n < 0;
    unsigned long long v = neg ? 0ull - (unsigned long long)n : (unsigned long long)n;
    do {
        tmp[k++] = DIGITS[v % (unsigned)base];
        v /= (unsigned)base;
    } while (v);
    size_t w = 0;
    if (neg && w + 1 < cap) buf[w++] = '-';
    while (k && w + 1 < cap) buf[w++] = tmp[--k];
    buf[w] = '\0';
    return buf;
}

int main(void) {
    long long cases[][2] = {{255, 2}, {255, 16}, {-1295, 36}, {0, 7}, {9223372036854775807LL, 36}};
    char buf[80];
    for (int i = 0; i < 5; i++) {
        to_base(cases[i][0], (int)cases[i][1], buf, sizeof buf);
        long long back = strtoll(buf, NULL, (int)cases[i][1]);
        printf("%lld base %lld = %s (strtoll roundtrip %s)\n", cases[i][0], cases[i][1], buf, back == cases[i][0] ? "ok" : "FAIL");
    }
    return 0;
}
