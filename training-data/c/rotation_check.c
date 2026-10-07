#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool is_rotation(const char *a, const char *b) {
    size_t n = strlen(a);
    if (n != strlen(b)) return false;
    char *doubled = malloc(2 * n + 1);
    if (!doubled) return false;
    memcpy(doubled, a, n);
    memcpy(doubled + n, a, n + 1);
    bool found = strstr(doubled, b) != NULL;
    free(doubled);
    return found;
}

int main(void) {
    printf("%d %d\n", is_rotation("waterbottle", "erbottlewat"), is_rotation("abc", "acb"));
    return 0;
}
