#include <iostream>
#include <string>
#include <vector>

// Iterative generation by dynamic programming over the number of pairs:
// every string is "(" + a + ")" + b where a has i pairs and b has n-1-i.
std::vector<std::string> generate(int n) {
    std::vector<std::vector<std::string>> dp(static_cast<std::size_t>(n) + 1);
    dp[0] = {""};
    for (int k = 1; k <= n; ++k)
        for (int i = 0; i < k; ++i)
            for (const auto& a : dp[i])
                for (const auto& b : dp[k - 1 - i]) dp[k].push_back("(" + a + ")" + b);
    return dp[n];
}

int main() {
    for (const auto& s : generate(3)) std::cout << s << ' ';
    std::cout << "\nn=9: " << generate(9).size() << '\n';
}
