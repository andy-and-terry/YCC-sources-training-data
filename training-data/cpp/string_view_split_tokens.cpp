#include <iostream>
#include <string_view>
#include <vector>

std::vector<std::string_view> split(std::string_view s, char d) {
    std::vector<std::string_view> out;
    while (true) {
        auto p = s.find(d);
        out.push_back(s.substr(0, p));
        if (p == std::string_view::npos) break;
        s.remove_prefix(p + 1);
    }
    return out;
}

int main() {
    for (auto t : split("a,bb,ccc", ',')) std::cout << "[" << t << "]";
    std::cout << "\n";
}
