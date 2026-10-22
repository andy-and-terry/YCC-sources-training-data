#include <iostream>
#include <vector>

std::vector<int> kolakoski(std::size_t count) {
    std::vector<int> seq{1, 2, 2};
    for (std::size_t i = 2; seq.size() < count; ++i) {
        int value = 3 - seq.back();
        seq.insert(seq.end(), seq[i], value);
    }
    seq.resize(count);
    return seq;
}

int main() {
    for (int v : kolakoski(20)) std::cout << v << ' ';
    std::cout << '\n';
}
