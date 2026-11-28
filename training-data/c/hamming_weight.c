#include <stdio.h>

int popcount(unsigned long n) {
    int c = 0;
    while (n) {
        n &= n - 1;
        c++;
    }
    return c;
}

int main(void) {
    printf("%d %d\n", popcount(0xB7), popcount(255));
    return 0;
}
