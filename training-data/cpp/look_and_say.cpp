#include <iostream>
#include <string>

std::string nextTerm(const std::string& s) {
    std::string out;
    for (size_t i = 0; i < s.size();) {
        size_t j = i;
        while (j < s.size() && s[j] == s[i]) ++j;
        out += std::to_string(j - i);
        out += s[i];
        i = j;
    }
    return out;
}

int main() {
    std::string s = "1";
    for (int i = 0; i < 8; ++i, s = nextTerm(s)) std::cout << s << '\n';
}
