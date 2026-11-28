#include <iostream>
#include <vector>

std::vector<int> stern(std::size_t count) {
    std::vector<int> seq(count < 2 ? 2 : count);
    seq[1] = 1;
    for (std::size_t i = 2; i < count; ++i)
        seq[i] = (i % 2 == 0) ? seq[i / 2] : seq[i / 2] + seq[i / 2 + 1];
    seq.resize(count);
    return seq;
}

int main() {
    for (int v : stern(15)) std::cout << v << ' ';
    std::cout << '\n'; // 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
}
