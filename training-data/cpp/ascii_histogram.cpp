#include <algorithm>
#include <iostream>
#include <map>
#include <string>

void histogram(const std::string& s, int width) {
    std::map<char, int> counts;
    for (char c : s) ++counts[c];
    int peak = 0;
    for (const auto& [k, n] : counts) peak = std::max(peak, n);
    for (const auto& [k, n] : counts)
        std::cout << k << " | " << std::string(std::max(1, n * width / peak), '#') << ' ' << n << '\n';
}

int main() { histogram("theraininspainfallsmainlyontheplain", 30); }
