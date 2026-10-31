#include <iostream>

#include <algorithm>
#include <string>

bool isSelfDescribing(const std::string& s) {
    for (std::size_t i = 0; i < s.size(); ++i) {
        auto count = std::count(s.begin(), s.end(), static_cast<char>('0' + i));
        if (count != s[i] - '0') return false;
    }
    return true;
}

int main() {
    for (const char* s : {"1210", "2020", "21200", "1211"})
        std::cout << s << ' ' << std::boolalpha << isSelfDescribing(s) << '\n';
}
