#include <algorithm>
#include <iostream>
#include <utility>
#include <vector>

using Interval = std::pair<int, int>;

std::vector<Interval> insertInterval(const std::vector<Interval>& iv, Interval n) {
    std::vector<Interval> out;
    std::size_t i = 0;
    while (i < iv.size() && iv[i].second < n.first) out.push_back(iv[i++]);
    while (i < iv.size() && iv[i].first <= n.second) {
        n = {std::min(n.first, iv[i].first), std::max(n.second, iv[i].second)};
        ++i;
    }
    out.push_back(n);
    out.insert(out.end(), iv.begin() + i, iv.end());
    return out;
}

int main() {
    for (auto [lo, hi] : insertInterval({{1, 3}, {6, 9}}, {2, 5}))
        std::cout << '[' << lo << ',' << hi << "] ";
    std::cout << '\n';  // [1,5] [6,9]
}
