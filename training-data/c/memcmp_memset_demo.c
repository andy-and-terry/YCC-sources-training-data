#include <stdio.h>
#include <string.h>

int main(void) {
    unsigned char a[8], b[8];
    memset(a, 0xAB, sizeof a);
    memset(b, 0xAB, sizeof b);
    printf("equal: %s\n", memcmp(a, b, sizeof a) == 0 ? "yes" : "no");
    b[5] = 0;
    printf("after change: %d\n", memcmp(a, b, sizeof a) > 0 ? 1 : -1);
    memcpy(b, a, sizeof a);
    printf("after copy equal: %s\n", memcmp(a, b, sizeof a) == 0 ? "yes" : "no");
    return 0;
}
