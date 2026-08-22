#include <iostream>
#include <string>
#include <vector>

std::vector<int> buildLPS(const std::string& pattern) {
    std::vector<int> lps(pattern.size(), 0);
    int length = 0, i = 1;
    while (i < static_cast<int>(pattern.size())) {
        if (pattern[i] == pattern[length]) {
            lps[i++] = ++length;
        } else if (length != 0) {
            length = lps[length - 1];
        } else {
            lps[i++] = 0;
        }
    }
    return lps;
}

std::vector<int> kmpSearch(const std::string& text, const std::string& pattern) {
    std::vector<int> matches;
    if (pattern.empty()) return matches;
    auto lps = buildLPS(pattern);
    int i = 0, j = 0;
    while (i < static_cast<int>(text.size())) {
        if (text[i] == pattern[j]) {
            i++; j++;
            if (j == static_cast<int>(pattern.size())) {
                matches.push_back(i - j);
                j = lps[j - 1];
            }
        } else if (j != 0) {
            j = lps[j - 1];
        } else {
            i++;
        }
    }
    return matches;
}

int main() {
    for (int x : kmpSearch("abxabcabcaby", "abcaby")) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
