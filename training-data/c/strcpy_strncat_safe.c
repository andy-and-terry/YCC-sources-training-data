#include <stdio.h>
#include <string.h>

/* Append src to dst without overflowing a buffer of size cap. */
static int safe_append(char *dst, size_t cap, const char *src) {
    size_t len = strlen(dst);
    if (len + strlen(src) + 1 > cap) return -1;
    strcat(dst, src);
    return 0;
}

int main(void) {
    char buf[16] = "Hello";
    printf("%d %s\n", safe_append(buf, sizeof buf, ", C"), buf);
    printf("%d %s\n", safe_append(buf, sizeof buf, " is a long tail"), buf);
    return 0;
}
