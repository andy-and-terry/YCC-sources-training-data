#include <stdio.h>
#include <math.h>

double area(const double pts[][2], int n) {
    double s = 0;
    for (int i = 0; i < n; i++) {
        int j = (i + 1) % n;
        s += pts[i][0] * pts[j][1] - pts[j][0] * pts[i][1];
    }
    return fabs(s) / 2;
}

int main(void) {
    double sq[4][2] = {{0, 0}, {4, 0}, {4, 3}, {0, 3}};
    printf("%.1f\n", area(sq, 4));
    return 0;
}
