#include <stdio.h>

const char *classify(double a, double b, double c) {
    if (a <= 0 || b <= 0 || c <= 0 || a + b <= c || a + c <= b || b + c <= a) return "invalid";
    if (a == b && b == c) return "equilateral";
    if (a == b || b == c || a == c) return "isosceles";
    return "scalene";
}

int main(void) {
    printf("%s %s %s %s\n", classify(3, 3, 3), classify(3, 4, 4), classify(3, 4, 5), classify(1, 1, 3));
    return 0;
}
