#include <stdio.h>
#include <stdlib.h>

int gcd(int a, int b) {
    while (b != 0) {
        int t = b;
        b = a % b;
        a = t;
    }
    return abs(a);
}

int main(void) {
    printf("%d\n", gcd(48, 18));
    return 0;
}
