#include <iostream>
#include <utility>
#include <vector>

int main() {
    constexpr int limit = 80;
    std::vector<bool> prime(limit + 1, true);
    prime[0] = prime[1] = false;
    for (int i = 2; i * i <= limit; ++i)
        if (prime[i]) for (int j = i * i; j <= limit; j += i) prime[j] = false;
    std::vector<std::pair<int, int>> pairs;
    for (int p = 2; p + 2 <= limit; ++p)
        if (prime[p] && prime[p + 2]) pairs.emplace_back(p, p + 2);
    for (auto [a, b] : pairs) std::cout << '(' << a << ',' << b << ") ";
    std::cout << '\n';  // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
}
