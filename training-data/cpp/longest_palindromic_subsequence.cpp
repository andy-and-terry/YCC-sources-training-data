#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

std::string lps(const std::string& s) {
    const std::size_t n = s.size();
    if (!n) return "";
    std::vector<std::vector<int>> dp(n, std::vector<int>(n, 0));
    for (std::size_t i = n; i-- > 0;) {
        dp[i][i] = 1;
        for (std::size_t j = i + 1; j < n; ++j)
            dp[i][j] = s[i] == s[j] ? (i + 1 <= j - 1 ? dp[i + 1][j - 1] : 0) + 2 : std::max(dp[i + 1][j], dp[i][j - 1]);
    }
    std::string left, right;
    for (std::size_t i = 0, j = n - 1; i <= j && j < n;) {
        if (i == j) {
            left += s[i];
            break;
        }
        if (s[i] == s[j]) {
            left += s[i++];
            right += s[j--];
        } else if (dp[i + 1][j] >= dp[i][j - 1]) {
            ++i;
        } else {
            --j;
        }
    }
    std::reverse(right.begin(), right.end());
    return left + right;
}

int main() {
    for (std::string s : {"bbbab", "character", "agbdba", "cbbd"}) std::cout << s << " -> " << lps(s) << '\n';
}
