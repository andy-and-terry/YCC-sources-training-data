#include <algorithm>
#include <iostream>
#include <vector>

// Hamming numbers (5-smooth), built by merging the x2, x3, x5 streams
int main() {
    std::vector<long long> h{1};
    std::size_t i2 = 0, i3 = 0, i5 = 0;
    while (h.size() < 20) {
        long long next = std::min({h[i2] * 2, h[i3] * 3, h[i5] * 5});
        h.push_back(next);
        if (next == h[i2] * 2) ++i2;
        if (next == h[i3] * 3) ++i3;
        if (next == h[i5] * 5) ++i5;
    }
    for (auto v : h) std::cout << v << ' ';
    std::cout << '\n';
}
