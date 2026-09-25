#include <iomanip>
#include <iostream>
#include <vector>

std::vector<std::vector<unsigned long long>> pascal(int rows) {
    std::vector<std::vector<unsigned long long>> t;
    for (int r = 0; r < rows; ++r) {
        std::vector<unsigned long long> row(static_cast<std::size_t>(r) + 1, 1);
        for (int i = 1; i < r; ++i) row[i] = t[r - 1][i - 1] + t[r - 1][i];
        t.push_back(std::move(row));
    }
    return t;
}

int main() {
    const int rows = 10;
    auto t = pascal(rows);
    for (int r = 0; r < rows; ++r) {
        std::cout << std::string(static_cast<std::size_t>((rows - r - 1) * 2), ' ');
        for (auto v : t[r]) std::cout << std::setw(4) << v;
        std::cout << '\n';
    }
    // row sums are powers of two
    for (int r = 0; r < rows; ++r) {
        unsigned long long s = 0;
        for (auto v : t[r]) s += v;
        if (s != (1ull << r)) std::cout << "bad row " << r << '\n';
    }
}
