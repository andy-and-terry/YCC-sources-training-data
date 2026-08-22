#include <iostream>
#include <queue>
#include <set>
#include <vector>

using Point = std::pair<int, int>;

std::vector<Point> solveMaze(const std::vector<std::vector<int>>& maze, Point start, Point end) {
    int rows = static_cast<int>(maze.size()), cols = static_cast<int>(maze[0].size());
    std::queue<std::pair<Point, std::vector<Point>>> queue;
    queue.push({start, {start}});
    std::set<Point> visited = {start};
    std::vector<Point> directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

    while (!queue.empty()) {
        auto [pos, path] = queue.front();
        queue.pop();
        if (pos == end) return path;
        for (auto& [dr, dc] : directions) {
            Point next = {pos.first + dr, pos.second + dc};
            if (next.first >= 0 && next.first < rows && next.second >= 0 && next.second < cols &&
                maze[next.first][next.second] == 0 && !visited.count(next)) {
                visited.insert(next);
                auto newPath = path;
                newPath.push_back(next);
                queue.push({next, newPath});
            }
        }
    }
    return {};
}

int main() {
    std::vector<std::vector<int>> maze = {
        {0, 1, 0, 0}, {0, 1, 0, 1}, {0, 0, 0, 1}, {1, 1, 0, 0}};
    for (auto& [r, c] : solveMaze(maze, {0, 0}, {3, 3})) std::cout << "(" << r << "," << c << ") ";
    std::cout << std::endl;
    return 0;
}
