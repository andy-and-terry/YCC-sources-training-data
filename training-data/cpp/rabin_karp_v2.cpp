#include <iostream>
#include <string>
#include <vector>

const int BASE = 256;
const int MOD = 101;

std::vector<int> rabinKarp(const std::string& text, const std::string& pattern) {
    std::vector<int> matches;
    int n = static_cast<int>(text.size());
    int m = static_cast<int>(pattern.size());
    if (m == 0 || m > n) return matches;

    int h = 1;
    for (int i = 0; i < m - 1; i++) h = (h * BASE) % MOD;

    int patternHash = 0, textHash = 0;
    for (int i = 0; i < m; i++) {
        patternHash = (BASE * patternHash + pattern[i]) % MOD;
        textHash = (BASE * textHash + text[i]) % MOD;
    }

    for (int i = 0; i <= n - m; i++) {
        if (patternHash == textHash && text.compare(i, m, pattern) == 0) {
            matches.push_back(i);
        }
        if (i < n - m) {
            textHash = (BASE * (textHash - text[i] * h) + text[i + m]) % MOD;
            if (textHash < 0) textHash += MOD;
        }
    }
    return matches;
}

int main() {
    for (int x : rabinKarp("abxabcabcaby", "abcaby")) std::cout << x << " ";
    std::cout << std::endl;
    for (int x : rabinKarp("aaaaaa", "aa")) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
