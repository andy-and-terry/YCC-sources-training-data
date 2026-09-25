#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

int longest_valid(const std::string& s) {
    std::vector<int> dp(s.size(), 0);
    int best = 0;
    for (std::size_t i = 1; i < s.size(); ++i) {
        if (s[i] != ')') continue;
        if (s[i - 1] == '(') {
            dp[i] = (i >= 2 ? dp[i - 2] : 0) + 2;
        } else {
            long j = static_cast<long>(i) - dp[i - 1] - 1;
            if (j >= 0 && s[static_cast<std::size_t>(j)] == '(') dp[i] = dp[i - 1] + 2 + (j >= 1 ? dp[static_cast<std::size_t>(j - 1)] : 0);
        }
        best = std::max(best, dp[i]);
    }
    return best;
}

int main() {
    for (std::string s : {"(()", ")()())", "", "()(()", "((()))()"}) std::cout << '"' << s << "\" " << longest_valid(s) << '\n';
}
