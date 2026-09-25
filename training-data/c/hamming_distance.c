#include <stdio.h>
#include <string.h>

/* Returns -1 when lengths differ. */
int hamming(const char *a, const char *b) {
    if (strlen(a) != strlen(b)) return -1;
    int d = 0;
    for (; *a; a++, b++) d += *a != *b;
    return d;
}

int main(void) {
    printf("%d\n", hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"));
    printf("%d\n", hamming("AB", "A"));
    return 0;
}
