#include <iostream>
#include <string>

int main() {
    std::string s = "abcabc";
    const int k = 3; const long B = 31, M = 1000003;
    long pw = 1, h = 0;
    for (int i = 1; i < k; i++) pw = pw * B % M;
    for (int i = 0; i < k; i++) h = (h * B + s[i]) % M;
    std::cout << 0 << ' ' << h << '\n';
    for (size_t i = 1; i + k <= s.size(); i++) {
        h = (h - s[i - 1] * pw % M + M) % M;
        h = (h * B + s[i + k - 1]) % M;
        std::cout << i << ' ' << h << '\n';
    }
}
