#include <iostream>
#include <string>
#include <vector>

std::vector<std::string> duval(const std::string& s) {
    std::vector<std::string> out;
    size_t n = s.size(), i = 0;
    while (i < n) {
        size_t j = i + 1, k = i;
        while (j < n && s[k] <= s[j]) { k = (s[k] < s[j]) ? i : k + 1; ++j; }
        while (i <= k) { out.push_back(s.substr(i, j - k)); i += j - k; }
    }
    return out;
}

int main() {
    for (auto& f : duval("banana")) std::cout << f << '\n';
}
