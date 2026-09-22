#include <iostream>
#include <string>
#include <vector>

std::vector<int> rabinKarp(const std::string& text, const std::string& pattern) {
    const int base = 256;
    const int mod = 101;
    int n = static_cast<int>(text.size());
    int m = static_cast<int>(pattern.size());
    std::vector<int> matches;
    if (m == 0 || m > n) return matches;

    long long patternHash = 0, windowHash = 0, h = 1;
    for (int i = 0; i < m - 1; i++) h = (h * base) % mod;

    for (int i = 0; i < m; i++) {
        patternHash = (base * patternHash + pattern[i]) % mod;
        windowHash = (base * windowHash + text[i]) % mod;
    }

    for (int i = 0; i <= n - m; i++) {
        if (patternHash == windowHash) {
            if (text.substr(i, m) == pattern) matches.push_back(i);
        }
        if (i < n - m) {
            windowHash = (base * (windowHash - text[i] * h) + text[i + m]) % mod;
            if (windowHash < 0) windowHash += mod;
        }
    }
    return matches;
}

int main() {
    for (int idx : rabinKarp("ABABDABACDABABCABAB", "ABABCABAB")) {
        std::cout << idx << " ";
    }
    std::cout << std::endl;
    return 0;
}
