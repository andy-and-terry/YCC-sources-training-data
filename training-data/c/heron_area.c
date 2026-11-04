#include <math.h>
#include <stdio.h>

/* compile with -lm */
double heron(double a, double b, double c) {
    if (a + b <= c || a + c <= b || b + c <= a) return -1.0;
    double s = (a + b + c) / 2.0;
    return sqrt(s * (s - a) * (s - b) * (s - c));
}

int main(void) {
    printf("%.2f\n", heron(3, 4, 5));
    printf("%.2f\n", heron(1, 2, 10));
    return 0;
}
