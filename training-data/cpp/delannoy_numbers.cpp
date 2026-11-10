#include <iostream>
#include <vector>

long central_delannoy(int n) {
    std::vector<std::vector<long>> g(n + 1, std::vector<long>(n + 1, 1));
    for (int i = 1; i <= n; ++i)
        for (int j = 1; j <= n; ++j)
            g[i][j] = g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1];
    return g[n][n];
}

int main() {
    for (int n = 0; n <= 5; ++n) std::cout << central_delannoy(n) << ' ';
    std::cout << '\n';  // 1 3 13 63 321 1683
}
