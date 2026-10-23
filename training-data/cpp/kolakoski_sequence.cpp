#include <iostream>
#include <vector>

std::vector<int> kolakoski(std::size_t count) {
    std::vector<int> seq{1, 2, 2};
    for (std::size_t i = 2; seq.size() < count; ++i) {
        int value = seq.back() == 2 ? 1 : 2;
        for (int k = 0; k < seq[i]; ++k) seq.push_back(value);
    }
    seq.resize(count);
    return seq;
}

int main() {
    for (int v : kolakoski(20)) std::cout << v << ' ';
    std::cout << '\n';
}
