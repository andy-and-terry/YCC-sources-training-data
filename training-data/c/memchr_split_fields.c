#include <stdio.h>
#include <string.h>

/* Split on a delimiter with memchr, without modifying the input
 * (unlike strtok) and without needing a NUL-terminated field. */
int main(void) {
    const char *line = "red,green,,blue";
    const char *p = line;
    const char *end = line + strlen(line);

    while (p <= end) {
        const char *comma = memchr(p, ',', (size_t)(end - p));
        const char *stop = comma ? comma : end;
        printf("field: \"%.*s\"\n", (int)(stop - p), p);
        if (!comma) break;
        p = comma + 1;
    }
    return 0;
}
