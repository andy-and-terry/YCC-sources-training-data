#include <math.h>
#include <stdio.h>

int main(void) {
    double x[] = {0, 4, 4, 0}, y[] = {0, 0, 3, 3};
    int n = 4;
    double s = 0;
    for (int i = 0; i < n; i++) {
        int j = (i + 1) % n;
        s += x[i] * y[j] - x[j] * y[i];
    }
    printf("%g\n", fabs(s) / 2);
    return 0;
}
