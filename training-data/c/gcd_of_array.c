#include <stdio.h>
#include <stdlib.h>

static int gcd(int a, int b) {
    a = abs(a); b = abs(b);
    while (b) { int t = a % b; a = b; b = t; }
    return a;
}

static int gcd_all(const int *v, int n) {
    int g = 0;
    for (int i = 0; i < n; i++) g = gcd(g, v[i]);
    return g;
}

int main(void) {
    int a[] = {12, 18, 24}, b[] = {7, 13};
    printf("%d %d\n", gcd_all(a, 3), gcd_all(b, 2));
    return 0;
}
