#include <algorithm>
#include <iostream>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

int main() {
    std::istringstream text("the cat and the hat and the bat");
    std::unordered_map<std::string, int> counts;
    std::string word;
    while (text >> word) ++counts[word];

    std::vector<std::pair<std::string, int>> items(counts.begin(), counts.end());
    std::sort(items.begin(), items.end(), [](auto& a, auto& b) {
        return a.second != b.second ? a.second > b.second : a.first < b.first;
    });
    for (auto& [w, n] : items) std::cout << w << ": " << n << "\n";
}
