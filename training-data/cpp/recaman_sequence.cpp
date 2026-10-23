#include <iostream>
#include <unordered_set>
#include <vector>

std::vector<int> recaman(int count) {
    std::vector<int> seq{0};
    std::unordered_set<int> seen{0};
    for (int n = 1; n < count; ++n) {
        int next = seq.back() - n;
        if (next < 0 || seen.count(next)) next = seq.back() + n;
        seq.push_back(next);
        seen.insert(next);
    }
    return seq;
}

int main() {
    for (int v : recaman(20)) std::cout << v << ' ';
    std::cout << '\n';
}
