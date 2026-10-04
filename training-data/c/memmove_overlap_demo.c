#include <stdio.h>
#include <string.h>

static void show(const char *label, const char *buf, size_t n) {
    printf("%-10s [%.*s]\n", label, (int)n, buf);
}

int main(void) {
    char a[] = "0123456789";
    char b[] = "0123456789";

    /* Overlapping regions: memmove is well defined, memcpy is not */
    memmove(a + 2, a, 5);
    show("memmove:", a, sizeof a - 1);

    /* Shift left to delete a character */
    memmove(b + 3, b + 4, strlen(b + 4) + 1);
    show("delete[3]:", b, strlen(b));

    /* Non-overlapping copy is fine with memcpy */
    char src[] = "hello";
    char dst[8];
    memcpy(dst, src, sizeof src);
    show("memcpy:", dst, strlen(dst));

    /* Insert 'XY' at position 2 of a larger buffer */
    char buf[16] = "abcdef";
    memmove(buf + 4, buf + 2, strlen(buf + 2) + 1);
    memcpy(buf + 2, "XY", 2);
    show("insert:", buf, strlen(buf));

    int arr[] = {1, 2, 3, 4, 5};
    memmove(arr + 1, arr, 4 * sizeof arr[0]);
    arr[0] = 0;
    for (size_t i = 0; i < 5; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
