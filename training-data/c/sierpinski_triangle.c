#include <stdio.h>

int main(void) {
    int n = 8;
    for (int r = 0; r < n; r++) {
        printf("%*s", n - r - 1, "");
        for (int c = 0; c <= r; c++)
            printf("%s", (r & c) == c ? "* " : "  ");
        putchar('\n');
    }
    return 0;
}
