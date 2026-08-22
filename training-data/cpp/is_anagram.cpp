#include <algorithm>
#include <cctype>
#include <iostream>
#include <string>

bool isAnagram(std::string a, std::string b) {
    auto normalize = [](std::string s) {
        s.erase(std::remove_if(s.begin(), s.end(), ::isspace), s.end());
        std::transform(s.begin(), s.end(), s.begin(), ::tolower);
        std::sort(s.begin(), s.end());
        return s;
    };
    return normalize(a) == normalize(b);
}

int main() {
    std::cout << isAnagram("listen", "silent") << std::endl;
    std::cout << isAnagram("hello", "world") << std::endl;
    return 0;
}
