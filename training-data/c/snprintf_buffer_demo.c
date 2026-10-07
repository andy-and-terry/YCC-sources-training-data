#include <stdio.h>

int main(void) {
    char small[8];
    /* snprintf never overflows; it returns the length it WANTED to write. */
    int needed = snprintf(small, sizeof small, "value=%d", 123456);
    printf("buffer: \"%s\" needed: %d\n", small, needed);
    if (needed >= (int)sizeof small) printf("output was truncated\n");

    char big[32];
    snprintf(big, sizeof big, "%05.1f|%-6s|%x", 3.14159, "ab", 255);
    printf("%s\n", big);
    return 0;
}
