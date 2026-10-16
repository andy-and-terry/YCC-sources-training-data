#include <stdio.h>

int main(void) {
    int n = 90210, count = 0, rev = 0;
    int t = n;
    do {
        rev = rev * 10 + t % 10;
        t /= 10;
        count++;
    } while (t > 0);
    printf("%d has %d digits; reversed = %d\n", n, count, rev);
    return 0;
}
