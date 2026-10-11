#include <stdio.h>

static unsigned long gcd(unsigned long a, unsigned long b) {
    while (b) { unsigned long t = a % b; a = b; b = t; }
    return a;
}

int main(void) {
    unsigned long v[] = {4, 6, 10, 15};
    unsigned long l = 1;
    for (int i = 0; i < 4; i++) l = l / gcd(l, v[i]) * v[i];
    printf("lcm = %lu\n", l);
    return 0;
}
