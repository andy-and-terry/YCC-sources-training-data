#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

std::string interleave(const std::vector<std::string> &parts) {
    size_t longest = 0;
    for (const auto &p : parts) longest = std::max(longest, p.size());
    std::string out;
    for (size_t i = 0; i < longest; ++i)
        for (const auto &p : parts)
            if (i < p.size()) out += p[i];
    return out;
}

int main() {
    std::cout << interleave({"abc", "12345"}) << '\n' << interleave({"ab", "cd", "efg"}) << '\n';
}
