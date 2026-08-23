#include <stdio.h>

typedef struct {
    double x;
    double y;
} Point;

Point add_points(Point a, Point b) {
    Point result = {a.x + b.x, a.y + b.y};
    return result;
}

int main(void) {
    Point p1 = {1.0, 2.0};
    Point p2 = {3.0, 4.0};
    Point p3 = add_points(p1, p2);
    printf("(%.1f, %.1f)\n", p3.x, p3.y);
    return 0;
}
