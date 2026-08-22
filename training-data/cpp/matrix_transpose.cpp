#include <iostream>
#include <vector>

std::vector<std::vector<int>> transpose(const std::vector<std::vector<int>>& matrix) {
    size_t rows = matrix.size(), cols = matrix[0].size();
    std::vector<std::vector<int>> result(cols, std::vector<int>(rows));
    for (size_t i = 0; i < rows; i++)
        for (size_t j = 0; j < cols; j++)
            result[j][i] = matrix[i][j];
    return result;
}

int main() {
    std::vector<std::vector<int>> m = {{1, 2, 3}, {4, 5, 6}};
    for (const auto& row : transpose(m)) {
        for (int x : row) std::cout << x << " ";
        std::cout << std::endl;
    }
    return 0;
}
