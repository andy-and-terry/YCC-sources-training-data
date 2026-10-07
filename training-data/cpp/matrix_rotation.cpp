#include <iostream>
#include <vector>
#include <algorithm>

void rotate90Clockwise(std::vector<std::vector<int>>& matrix) {
    int n = static_cast<int>(matrix.size());
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            std::swap(matrix[i][j], matrix[j][i]);
        }
    }
    for (auto& row : matrix) {
        std::reverse(row.begin(), row.end());
    }
}

void printMatrix(const std::vector<std::vector<int>>& matrix) {
    for (const auto& row : matrix) {
        for (int v : row) std::cout << v << " ";
        std::cout << std::endl;
    }
}

int main() {
    std::vector<std::vector<int>> matrix = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    rotate90Clockwise(matrix);
    printMatrix(matrix);
    return 0;
}
