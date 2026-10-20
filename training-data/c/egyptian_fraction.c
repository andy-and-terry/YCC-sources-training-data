#include <stdio.h>

int main(void) {
    unsigned long long num = 4, den = 13;
    while (num != 0) {
        unsigned long long d = (den + num - 1) / num;
        printf("1/%llu%s", d, (num * d - den) ? " + " : "\n");
        num = num * d - den;
        den *= d;
    }
    return 0;
}
