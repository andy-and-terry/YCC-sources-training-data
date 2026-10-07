#include <stdbool.h>
#include <stdio.h>

static unsigned long ipow(unsigned long b, int e) {
    unsigned long r = 1;
    while (e--) r *= b;
    return r;
}

bool is_armstrong(unsigned long n) {
    int k = 0;
    for (unsigned long t = n; t; t /= 10) k++;
    unsigned long sum = 0;
    for (unsigned long t = n; t; t /= 10) sum += ipow(t % 10, k);
    return sum == n;
}

int main(void) {
    for (unsigned long n = 1; n < 10000000; n++)
        if (is_armstrong(n)) printf("%lu ", n);
    printf("\n");
    return 0;
}
