#include <stdio.h>

int main(void) {
    char small[8];
    char large[64];

    int needed = snprintf(small, sizeof(small), "value=%d", 123456);
    printf("small buffer: \"%s\" (needed %d chars)\n", small, needed);

    int n = snprintf(large, sizeof(large), "%s has %d items totaling $%.2f",
                     "cart", 3, 59.97);
    printf("large buffer: \"%s\" (%d chars)\n", large, n);

    /* Appending with a moving offset */
    char line[32];
    size_t used = 0;
    for (int i = 1; i <= 5; i++) {
        used += snprintf(line + used, sizeof(line) - used, "%d,", i * i);
    }
    printf("appended: %s\n", line);
    return 0;
}
