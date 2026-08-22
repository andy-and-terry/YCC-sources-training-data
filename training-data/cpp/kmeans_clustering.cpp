#include <cmath>
#include <iostream>
#include <vector>

struct Point {
    double x, y;
};

double distance(const Point& a, const Point& b) {
    return std::sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y));
}

std::vector<Point> kmeans(const std::vector<Point>& points, int k, int iterations) {
    std::vector<Point> centroids(points.begin(), points.begin() + k);

    for (int iter = 0; iter < iterations; iter++) {
        std::vector<std::vector<Point>> clusters(k);
        for (auto& p : points) {
            int closest = 0;
            double minDist = 1e18;
            for (int i = 0; i < k; i++) {
                double d = distance(p, centroids[i]);
                if (d < minDist) {
                    minDist = d;
                    closest = i;
                }
            }
            clusters[closest].push_back(p);
        }

        for (int i = 0; i < k; i++) {
            if (clusters[i].empty()) continue;
            double sumX = 0, sumY = 0;
            for (auto& p : clusters[i]) {
                sumX += p.x;
                sumY += p.y;
            }
            centroids[i] = {sumX / clusters[i].size(), sumY / clusters[i].size()};
        }
    }
    return centroids;
}

int main() {
    std::vector<Point> points = {{1, 1}, {1.5, 2}, {3, 4}, {5, 7}, {3.5, 5}, {4.5, 5}, {3.5, 4.5}};
    for (auto& c : kmeans(points, 2, 20)) std::cout << "(" << c.x << ", " << c.y << ") ";
    std::cout << std::endl;
    return 0;
}
