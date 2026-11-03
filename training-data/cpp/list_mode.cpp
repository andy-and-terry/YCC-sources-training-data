#include <iostream>
#include <map>
#include <vector>

std::vector<int> modes(const std::vector<int>& items) {
    std::map<int, int> counts;
    int top = 0;
    for (int x : items) top = std::max(top, ++counts[x]);
    std::vector<int> out;
    for (auto& [k, c] : counts)
        if (c == top) out.push_back(k);
    return out;
}

int main() {
    for (int m : modes({1, 2, 2, 3, 3, 4})) std::cout << m << ' ';
    std::cout << '\n';
}
