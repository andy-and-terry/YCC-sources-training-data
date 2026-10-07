#include <iostream>
#include <string>
#include <vector>

// z[i] = length of the longest substring starting at i that matches
// a prefix of s.
std::vector<int> zFunction(const std::string& s) {
    int n = static_cast<int>(s.size());
    std::vector<int> z(n, 0);
    int l = 0, r = 0;

    for (int i = 1; i < n; i++) {
        if (i < r) {
            z[i] = std::min(r - i, z[i - l]);
        }
        while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
            z[i]++;
        }
        if (i + z[i] > r) {
            l = i;
            r = i + z[i];
        }
    }
    return z;
}

std::vector<int> findOccurrences(const std::string& text, const std::string& pattern) {
    std::string combined = pattern + "$" + text;
    std::vector<int> z = zFunction(combined);
    std::vector<int> positions;
    int patternLen = static_cast<int>(pattern.size());

    for (int i = patternLen + 1; i < static_cast<int>(combined.size()); i++) {
        if (z[i] == patternLen) {
            positions.push_back(i - patternLen - 1);
        }
    }
    return positions;
}

int main() {
    std::string text = "abxabcabcaby";
    std::string pattern = "abc";

    for (int match : findOccurrences(text, pattern)) {
        std::cout << "match at index " << match << std::endl;
    }
    return 0;
}
