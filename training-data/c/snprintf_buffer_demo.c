#include <stdio.h>

int main(void) {
    char small[8];
    int needed = snprintf(small, sizeof small, "%s-%d", "value", 12345);
    printf("buffer: '%s' (needed %d chars)\n", small, needed);

    char line[64];
    size_t off = 0;
    for (int i = 1; i <= 5; i++) {
        off += snprintf(line + off, sizeof line - off, "%d%s", i * i, i < 5 ? "," : "");
    }
    printf("%s (len %zu)\n", line, off);
    return 0;
}
