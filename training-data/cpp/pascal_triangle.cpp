#include <iomanip>
#include <iostream>
#include <vector>

std::vector<std::vector<int>> pascal(int rows) {
    std::vector<std::vector<int>> tri;
    for (int i = 0; i < rows; i++) {
        std::vector<int> row(i + 1, 1);
        for (int j = 1; j < i; j++) {
            row[j] = tri[i - 1][j - 1] + tri[i - 1][j];
        }
        tri.push_back(row);
    }
    return tri;
}

int main() {
    for (const auto& row : pascal(7)) {
        std::cout << std::string((7 - row.size()) * 2, ' ');
        for (int v : row) std::cout << std::setw(4) << v;
        std::cout << "\n";
    }
    return 0;
}
