#include <stdio.h>
#include <stddef.h>

/* Subtracting pointers into the same array yields a ptrdiff_t counted
 * in elements, not bytes. */
int main(void) {
    int data[] = {10, 20, 30, 40, 50};
    int *first = &data[0];
    int *found = NULL;

    for (int *p = first; p < first + 5; p++) {
        if (*p == 40) { found = p; break; }
    }

    ptrdiff_t index = found - first;
    printf("index of 40: %td\n", index);
    printf("byte distance: %td\n", (char *)found - (char *)first);
    printf("elements to end: %td\n", (first + 5) - found);
    return 0;
}
