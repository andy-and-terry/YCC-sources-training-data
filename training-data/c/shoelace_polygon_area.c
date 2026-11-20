#include <stdio.h>
#include <math.h>
/* Shoelace polygon area. */
typedef struct { double x, y; } Point;
static double area(const Point *p, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) {
        const Point *q = &p[(i + 1) % n];
        s += p[i].x * q->y - q->x * p[i].y;
    }
    return fabs(s) / 2;
}
int main(void) {
    Point sq[] = {{0, 0}, {4, 0}, {4, 3}, {0, 3}};
    printf("%.1f\n", area(sq, 4));
    return 0;
}
