#include <stdio.h>


int persistence(long n) {
    int steps = 0;
    while (n >= 10) {
        long product = 1;
        for (; n > 0; n /= 10) product *= n % 10;
        n = product;
        steps++;
    }
    return steps;
}

int main(void) {
    long values[] = {39, 77, 999, 10};
    for (int i = 0; i < 4; i++)
        printf("%ld %d\n", values[i], persistence(values[i]));
    return 0;
}
