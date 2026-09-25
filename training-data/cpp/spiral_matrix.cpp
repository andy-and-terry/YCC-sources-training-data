#include <iomanip>
#include <iostream>
#include <vector>

std::vector<std::vector<int>> spiral(int n) {
    std::vector<std::vector<int>> g(n, std::vector<int>(n));
    int top = 0, left = 0, bottom = n - 1, right = n - 1, k = 1;
    while (top <= bottom && left <= right) {
        for (int c = left; c <= right; ++c) g[top][c] = k++;
        ++top;
        for (int r = top; r <= bottom; ++r) g[r][right] = k++;
        --right;
        if (top <= bottom) { for (int c = right; c >= left; --c) g[bottom][c] = k++; --bottom; }
        if (left <= right) { for (int r = bottom; r >= top; --r) g[r][left] = k++; ++left; }
    }
    return g;
}

int main() {
    for (const auto& row : spiral(4)) {
        for (int v : row) std::cout << std::setw(3) << v;
        std::cout << '\n';
    }
}
