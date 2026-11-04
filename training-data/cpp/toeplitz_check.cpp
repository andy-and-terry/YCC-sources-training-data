#include <algorithm>
#include <iostream>
#include <vector>

using Matrix = std::vector<std::vector<int>>;

bool is_toeplitz(const Matrix &m) {
    for (size_t i = 1; i < m.size(); ++i)
        if (!std::equal(m[i].begin() + 1, m[i].end(), m[i - 1].begin())) return false;
    return true;
}

int main() {
    std::cout << std::boolalpha << is_toeplitz({{1, 2, 3}, {4, 1, 2}, {5, 4, 1}}) << ' '
              << is_toeplitz({{1, 2}, {2, 2}}) << '\n';
}
