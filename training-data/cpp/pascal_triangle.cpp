#include <iostream>
#include <vector>

std::vector<std::vector<long long>> pascal(int rows) {
    std::vector<std::vector<long long>> tri;
    for (int i = 0; i < rows; ++i) {
        std::vector<long long> row(i + 1, 1);
        for (int j = 1; j < i; ++j) {
            row[j] = tri[i - 1][j - 1] + tri[i - 1][j];
        }
        tri.push_back(row);
    }
    return tri;
}

int main() {
    for (const auto &row : pascal(6)) {
        for (long long v : row) std::cout << v << " ";
        std::cout << std::endl;
    }
    return 0;
}
