#include <stdio.h>
#include <string.h>

int main(void) {
    char a[] = "0123456789";
    char b[] = "0123456789";

    /* Shift the first 5 characters right by 2; the regions overlap. */
    memmove(a + 2, a, 5);
    printf("memmove: %s\n", a);

    /* memcpy on overlapping regions is undefined behavior, so copy
       from a separate source buffer instead. */
    char src[] = "abcde";
    memcpy(b + 2, src, 5);
    printf("memcpy:  %s\n", b);

    char buf[8];
    memset(buf, '-', sizeof(buf) - 1);
    buf[sizeof(buf) - 1] = '\0';
    printf("memset:  %s\n", buf);

    printf("memcmp:  %d\n", memcmp("abc", "abd", 3) < 0);
    return 0;
}
