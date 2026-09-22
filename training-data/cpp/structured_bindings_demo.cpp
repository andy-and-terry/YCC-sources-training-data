#include <iostream>
#include <map>
#include <tuple>

struct Point {
    int x;
    int y;
};

std::tuple<int, int, int> minMaxSum(const std::map<std::string, int>& scores) {
    int minVal = scores.begin()->second;
    int maxVal = scores.begin()->second;
    int sum = 0;
    for (const auto& [name, score] : scores) {
        minVal = std::min(minVal, score);
        maxVal = std::max(maxVal, score);
        sum += score;
    }
    return {minVal, maxVal, sum};
}

int main() {
    std::map<std::string, int> scores{{"alice", 90}, {"bob", 75}, {"carol", 88}};

    for (const auto& [name, score] : scores) {
        std::cout << name << ": " << score << std::endl;
    }

    auto [lo, hi, total] = minMaxSum(scores);
    std::cout << "min=" << lo << " max=" << hi << " sum=" << total << std::endl;

    Point p{3, 4};
    auto [x, y] = p;
    std::cout << "x=" << x << " y=" << y << std::endl;

    return 0;
}
