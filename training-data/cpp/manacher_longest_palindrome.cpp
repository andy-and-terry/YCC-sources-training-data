#include <iostream>
#include <string>
#include <vector>

std::string longestPalindrome(const std::string& s) {
    std::string t = "^";
    for (char c : s) {
        t += "#";
        t += c;
    }
    t += "#$";

    int n = t.size();
    std::vector<int> p(n, 0);
    int center = 0, right = 0;

    for (int i = 1; i < n - 1; ++i) {
        if (i < right) {
            p[i] = std::min(right - i, p[2 * center - i]);
        }
        while (t[i + p[i] + 1] == t[i - p[i] - 1]) {
            ++p[i];
        }
        if (i + p[i] > right) {
            center = i;
            right = i + p[i];
        }
    }

    int maxLen = 0, centerIndex = 0;
    for (int i = 1; i < n - 1; ++i) {
        if (p[i] > maxLen) {
            maxLen = p[i];
            centerIndex = i;
        }
    }

    int start = (centerIndex - maxLen) / 2;
    return s.substr(start, maxLen);
}

int main() {
    std::cout << longestPalindrome("babad") << std::endl;
    std::cout << longestPalindrome("cbbd") << std::endl;
    std::cout << longestPalindrome("racecarxyz") << std::endl;
    return 0;
}
