#include <algorithm>
#include <cmath>
#include <iostream>
#include <queue>
#include <unordered_map>
#include <vector>

struct Point {
    int x, y;
    bool operator==(const Point& other) const { return x == other.x && y == other.y; }
};

struct PointHash {
    size_t operator()(const Point& p) const { return std::hash<int>()(p.x) ^ (std::hash<int>()(p.y) << 1); }
};

double heuristic(Point a, Point b) {
    return std::abs(a.x - b.x) + std::abs(a.y - b.y);
}

std::vector<Point> aStar(const std::vector<std::vector<int>>& grid, Point start, Point goal) {
    int rows = static_cast<int>(grid.size());
    int cols = static_cast<int>(grid[0].size());

    using Candidate = std::pair<double, Point>;
    auto compare = [](const Candidate& a, const Candidate& b) { return a.first > b.first; };
    std::priority_queue<Candidate, std::vector<Candidate>, decltype(compare)> open(compare);

    std::unordered_map<Point, double, PointHash> costSoFar;
    std::unordered_map<Point, Point, PointHash> cameFrom;

    open.push({0.0, start});
    costSoFar[start] = 0.0;

    const std::vector<Point> directions{{0, 1}, {0, -1}, {1, 0}, {-1, 0}};

    while (!open.empty()) {
        Point current = open.top().second;
        open.pop();

        if (current == goal) break;

        for (const auto& dir : directions) {
            Point next{current.x + dir.x, current.y + dir.y};
            if (next.x < 0 || next.x >= rows || next.y < 0 || next.y >= cols) continue;
            if (grid[next.x][next.y] == 1) continue;

            double newCost = costSoFar[current] + 1.0;
            if (costSoFar.find(next) == costSoFar.end() || newCost < costSoFar[next]) {
                costSoFar[next] = newCost;
                double priority = newCost + heuristic(next, goal);
                open.push({priority, next});
                cameFrom[next] = current;
            }
        }
    }

    std::vector<Point> path;
    if (costSoFar.find(goal) == costSoFar.end()) return path;

    Point step = goal;
    while (!(step == start)) {
        path.push_back(step);
        step = cameFrom[step];
    }
    path.push_back(start);
    std::reverse(path.begin(), path.end());
    return path;
}

int main() {
    std::vector<std::vector<int>> grid{
        {0, 0, 0, 0, 0},
        {0, 1, 1, 1, 0},
        {0, 0, 0, 1, 0},
        {1, 1, 0, 1, 0},
        {0, 0, 0, 0, 0},
    };

    auto path = aStar(grid, {0, 0}, {4, 4});
    for (const auto& point : path) std::cout << "(" << point.x << "," << point.y << ") ";
    std::cout << std::endl;
    return 0;
}
