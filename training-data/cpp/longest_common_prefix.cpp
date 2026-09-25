#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

std::string longest_common_prefix(const std::vector<std::string>& words) {
    if (words.empty()) return "";
    auto [lo, hi] = std::minmax_element(words.begin(), words.end());
    auto mism = std::mismatch(lo->begin(), lo->end(), hi->begin(), hi->end());
    return std::string(lo->begin(), mism.first);
}

int main() {
    std::cout << '"' << longest_common_prefix({"flower", "flow", "flight"}) << "\"\n";
    std::cout << '"' << longest_common_prefix({"dog", "racecar", "car"}) << "\"\n";
    std::cout << '"' << longest_common_prefix({"interspecies", "interstellar", "interstate"}) << "\"\n";
}
