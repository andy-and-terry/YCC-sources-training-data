#include <algorithm>
#include <iostream>
#include <vector>

std::vector<std::pair<int, int>> mergeIntervals(std::vector<std::pair<int, int>> intervals) {
    std::sort(intervals.begin(), intervals.end());
    std::vector<std::pair<int, int>> merged;

    for (const auto& interval : intervals) {
        if (!merged.empty() && interval.first <= merged.back().second) {
            merged.back().second = std::max(merged.back().second, interval.second);
        } else {
            merged.push_back(interval);
        }
    }
    return merged;
}

int main() {
    std::vector<std::pair<int, int>> intervals{{1, 3}, {2, 6}, {8, 10}, {15, 18}, {9, 12}};
    auto merged = mergeIntervals(intervals);

    for (const auto& [start, end] : merged) std::cout << "[" << start << ", " << end << "] ";
    std::cout << std::endl;
    return 0;
}
