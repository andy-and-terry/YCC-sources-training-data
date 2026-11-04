#include <stdio.h>
#include <string.h>

void interleave(const char *a, const char *b, char *out) {
    size_t la = strlen(a), lb = strlen(b), k = 0;
    for (size_t i = 0; i < la || i < lb; i++) {
        if (i < la) out[k++] = a[i];
        if (i < lb) out[k++] = b[i];
    }
    out[k] = '\0';
}

int main(void) {
    char out[64];
    interleave("abc", "12345", out);
    puts(out);
    return 0;
}
