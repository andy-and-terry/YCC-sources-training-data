#include <algorithm>
#include <functional>
#include <iostream>
#include <iterator>
#include <queue>
#include <tuple>
#include <vector>

std::vector<int> merge_k(const std::vector<std::vector<int>>& lists) {
    using Entry = std::tuple<int, std::size_t, std::size_t>;
    std::priority_queue<Entry, std::vector<Entry>, std::greater<>> pq;
    for (std::size_t i = 0; i < lists.size(); ++i)
        if (!lists[i].empty()) pq.emplace(lists[i][0], i, 0);
    std::vector<int> out;
    while (!pq.empty()) {
        auto [v, li, idx] = pq.top();
        pq.pop();
        out.push_back(v);
        if (idx + 1 < lists[li].size()) pq.emplace(lists[li][idx + 1], li, idx + 1);
    }
    return out;
}

int main() {
    std::vector<int> a{1, 4, 7}, b{2, 3, 8, 9}, merged;
    std::merge(a.begin(), a.end(), b.begin(), b.end(), std::back_inserter(merged));
    for (int x : merged) std::cout << x << ' ';
    std::cout << '\n';
    for (int x : merge_k({{1, 5, 9}, {2, 6}, {}, {0, 3, 4, 10}})) std::cout << x << ' ';
    std::cout << '\n';
}
