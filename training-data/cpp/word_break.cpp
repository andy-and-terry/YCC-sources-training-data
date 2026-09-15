#include <iostream>
#include <string>
#include <unordered_set>
#include <vector>

bool wordBreak(const std::string& s, const std::unordered_set<std::string>& dict) {
    int n = static_cast<int>(s.size());
    std::vector<bool> dp(n + 1, false);
    dp[0] = true;

    for (int i = 1; i <= n; i++) {
        for (int j = 0; j < i; j++) {
            if (dp[j] && dict.count(s.substr(j, i - j))) {
                dp[i] = true;
                break;
            }
        }
    }
    return dp[n];
}

int main() {
    std::unordered_set<std::string> dict = {"leet", "code", "sand", "and", "cat", "cats", "dog"};
    std::cout << std::boolalpha;
    std::cout << wordBreak("leetcode", dict) << std::endl;
    std::cout << wordBreak("sandcats", dict) << std::endl;
    std::cout << wordBreak("catsanddog", {"cats", "dog", "sand", "and", "cat"}) << std::endl;
    std::cout << wordBreak("nomatch", dict) << std::endl;
    return 0;
}
