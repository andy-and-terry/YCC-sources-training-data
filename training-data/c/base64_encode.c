#include <stdio.h>
#include <string.h>

static const char TABLE[] =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static void base64_encode(const unsigned char *in, size_t len, char *out) {
    size_t o = 0;
    for (size_t i = 0; i < len; i += 3) {
        unsigned v = in[i] << 16;
        if (i + 1 < len) v |= in[i + 1] << 8;
        if (i + 2 < len) v |= in[i + 2];
        out[o++] = TABLE[(v >> 18) & 63];
        out[o++] = TABLE[(v >> 12) & 63];
        out[o++] = (i + 1 < len) ? TABLE[(v >> 6) & 63] : '=';
        out[o++] = (i + 2 < len) ? TABLE[v & 63] : '=';
    }
    out[o] = '\0';
}

int main(void) {
    const char *msgs[] = {"M", "Ma", "Man", "hello world"};
    char out[64];
    for (int i = 0; i < 4; i++) {
        base64_encode((const unsigned char *)msgs[i], strlen(msgs[i]), out);
        printf("%s -> %s\n", msgs[i], out);
    }
    return 0;
}
