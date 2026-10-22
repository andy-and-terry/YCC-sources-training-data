#include <algorithm>
#include <iostream>
#include <vector>

std::vector<int> ulam(std::size_t count) {
    std::vector<int> seq{1, 2};
    for (int n = 3; seq.size() < count; ++n) {
        int ways = 0;
        for (int a : seq) {
            if (a < n - a && std::find(seq.begin(), seq.end(), n - a) != seq.end()) ++ways;
        }
        if (ways == 1) seq.push_back(n);
    }
    return seq;
}

int main() {
    for (int v : ulam(15)) std::cout << v << ' ';
    std::cout << '\n';
}
