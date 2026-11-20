#include <cmath>
#include <iostream>
#include <vector>
// Shoelace area with a small Point struct.
struct Point { double x, y; };
double area(const std::vector<Point>& p) {
    double s = 0;
    for (size_t i = 0; i < p.size(); i++) {
        const Point& q = p[(i + 1) % p.size()];
        s += p[i].x * q.y - q.x * p[i].y;
    }
    return std::fabs(s) / 2;
}
int main() { std::cout << area({{0, 0}, {4, 0}, {4, 3}, {0, 3}}) << '\n'; }
