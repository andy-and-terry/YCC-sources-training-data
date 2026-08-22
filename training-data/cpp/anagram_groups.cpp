#include <algorithm>
#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

std::vector<std::vector<std::string>> groupAnagrams(const std::vector<std::string>& words) {
    std::unordered_map<std::string, std::vector<std::string>> groups;
    for (const auto& word : words) {
        std::string key = word;
        std::sort(key.begin(), key.end());
        groups[key].push_back(word);
    }
    std::vector<std::vector<std::string>> result;
    for (auto& [key, group] : groups) result.push_back(group);
    return result;
}

int main() {
    for (auto& group : groupAnagrams({"eat", "tea", "tan", "ate", "nat", "bat"})) {
        for (auto& w : group) std::cout << w << " ";
        std::cout << "| ";
    }
    std::cout << std::endl;
    return 0;
}
