#include <stdio.h>
#include <string.h>

static const char T[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static void b64(const unsigned char *s, size_t n, char *out) {
    for (size_t i = 0; i < n; i += 3) {
        unsigned v = s[i] << 16 | (i + 1 < n ? s[i + 1] << 8 : 0) | (i + 2 < n ? s[i + 2] : 0);
        *out++ = T[v >> 18]; *out++ = T[(v >> 12) & 63];
        *out++ = i + 1 < n ? T[(v >> 6) & 63] : '=';
        *out++ = i + 2 < n ? T[v & 63] : '=';
    }
    *out = 0;
}

int main(void) {
    char o[32];
    b64((const unsigned char *)"Man", 3, o); puts(o);
    b64((const unsigned char *)"Ma", 2, o); puts(o);
    b64((const unsigned char *)"M", 1, o); puts(o);
    return 0;
}
