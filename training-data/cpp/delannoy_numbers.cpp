#include <iostream>
#include <vector>

std::vector<long long> centralDelannoy(int count) {
    std::vector<std::vector<long long>> grid(count, std::vector<long long>(count, 1));
    for (int m = 1; m < count; ++m) {
        for (int n = 1; n < count; ++n) {
            grid[m][n] = grid[m - 1][n] + grid[m][n - 1] + grid[m - 1][n - 1];
        }
    }
    std::vector<long long> out;
    for (int k = 0; k < count; ++k) out.push_back(grid[k][k]);
    return out;
}

int main() {
    for (long long v : centralDelannoy(10)) std::cout << v << ' ';
    std::cout << '\n';
}
