#include <algorithm>
#include <iostream>
#include <vector>

long long ugly(int n) {
    std::vector<long long> seq{1};
    size_t i2 = 0, i3 = 0, i5 = 0;
    while (static_cast<int>(seq.size()) < n) {
        long long next = std::min({seq[i2] * 2, seq[i3] * 3, seq[i5] * 5});
        seq.push_back(next);
        if (next == seq[i2] * 2) ++i2;
        if (next == seq[i3] * 3) ++i3;
        if (next == seq[i5] * 5) ++i5;
    }
    return seq[n - 1];
}

int main() {
    for (int i = 1; i <= 12; ++i) std::cout << ugly(i) << ' ';
    std::cout << '\n';
}
