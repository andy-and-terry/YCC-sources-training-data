#include <algorithm>
#include <iostream>
#include <vector>

struct Point {
    long long x, y;
};

// Cross product of (o -> a) and (o -> b); positive means a->b turns left.
long long cross(const Point& o, const Point& a, const Point& b) {
    return (a.x - o.x) * (b.y - o.y) - (a.y - o.y) * (b.x - o.x);
}

// Andrew's monotone chain: sort by (x, y), then build the lower and upper
// hulls, each time popping points that would make a non-left turn.
std::vector<Point> convexHull(std::vector<Point> points) {
    int n = static_cast<int>(points.size());
    if (n < 3) return points;

    std::sort(points.begin(), points.end(), [](const Point& a, const Point& b) {
        return a.x < b.x || (a.x == b.x && a.y < b.y);
    });

    std::vector<Point> hull(2 * n);
    int k = 0;

    for (int i = 0; i < n; i++) {
        while (k >= 2 && cross(hull[k - 2], hull[k - 1], points[i]) <= 0) k--;
        hull[k++] = points[i];
    }

    int lowerSize = k + 1;
    for (int i = n - 2; i >= 0; i--) {
        while (k >= lowerSize && cross(hull[k - 2], hull[k - 1], points[i]) <= 0) k--;
        hull[k++] = points[i];
    }

    hull.resize(k - 1);
    return hull;
}

int main() {
    std::vector<Point> points = {
        {0, 0}, {1, 1}, {2, 2}, {3, 1}, {2, 0}, {1, -1}, {0, 2}
    };

    auto hull = convexHull(points);
    std::cout << "hull points: " << hull.size() << std::endl;
    for (const auto& p : hull) {
        std::cout << "(" << p.x << ", " << p.y << ")" << std::endl;
    }
    return 0;
}
