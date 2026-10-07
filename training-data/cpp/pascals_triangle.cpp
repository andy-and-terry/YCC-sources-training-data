#include <iostream>
#include <vector>

std::vector<std::vector<long long>> pascalsTriangle(int rows) {
    std::vector<std::vector<long long>> triangle;
    for (int r = 0; r < rows; r++) {
        std::vector<long long> row(r + 1, 1);
        for (int c = 1; c < r; c++) {
            row[c] = triangle[r - 1][c - 1] + triangle[r - 1][c];
        }
        triangle.push_back(row);
    }
    return triangle;
}

int main() {
    for (const auto& row : pascalsTriangle(6)) {
        for (long long v : row) std::cout << v << " ";
        std::cout << std::endl;
    }
    return 0;
}
