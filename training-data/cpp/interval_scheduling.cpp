#include <algorithm>
#include <iostream>
#include <vector>

struct Interval {
    int start, end;
};

// Merges overlapping intervals and also returns the max number of simultaneous intervals.
std::pair<std::vector<Interval>, int> analyze(std::vector<Interval> iv) {
    std::sort(iv.begin(), iv.end(), [](auto& a, auto& b) { return a.start < b.start; });
    std::vector<Interval> merged;
    for (const auto& x : iv) {
        if (!merged.empty() && x.start <= merged.back().end) merged.back().end = std::max(merged.back().end, x.end);
        else merged.push_back(x);
    }
    std::vector<std::pair<int, int>> events;
    for (const auto& x : iv) events.push_back({x.start, 1}), events.push_back({x.end, -1});
    std::sort(events.begin(), events.end());
    int cur = 0, peak = 0;
    for (auto [t, d] : events) peak = std::max(peak, cur += d);
    return {merged, peak};
}

int main() {
    auto [merged, peak] = analyze({{1, 4}, {3, 5}, {0, 6}, {8, 10}, {9, 12}, {15, 18}});
    for (const auto& m : merged) std::cout << '[' << m.start << ',' << m.end << "] ";
    std::cout << "\npeak overlap: " << peak << '\n';
}
