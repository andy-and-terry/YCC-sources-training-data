#include <iostream>
#include <string_view>
int main() {
    std::string_view s = "a,b,c";
    while (!s.empty()) {
        auto p = s.find(',');
        std::cout << s.substr(0, p) << "\n";
        if (p == s.npos) break;
        s.remove_prefix(p + 1);
    }
}
